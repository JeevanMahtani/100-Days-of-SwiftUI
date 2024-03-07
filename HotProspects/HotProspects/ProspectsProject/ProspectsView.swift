//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 3/3/24.
//

import CodeScanner
import SwiftData
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects : [Prospect]
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    @Binding var sortOrder: [SortDescriptor<Prospect>]
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case.none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                NavigationLink(destination: EditProspectView(prospect: prospect)) {
                    HStack {
                        Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .foregroundStyle(prospect.isContacted ? .green : .blue)
                        
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            
                            Text(prospect.emailAddress)
                                .foregroundStyle(.secondary)
                        }
                    }                
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(prospect)
                        }
                        
                        if prospect.isContacted {
                            Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                                prospect.isContacted.toggle()
                            }
                            .tint(.blue)
                        } else {
                            Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                                prospect.isContacted.toggle()
                            }
                            .tint(.green)
                            
                            Button("Remind Me", systemImage: "bell") {
                                addNotification(for: prospect)
                            }
                            .tint(.orange)
                        }
                    }
                    
                }
                .tag(prospect)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {    
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\Prospect.name),
                                    SortDescriptor(\Prospect.name, order: .reverse)
                                ])
                            
                            Text("Sort by recent")
                                .tag([
                                    SortDescriptor(\Prospect.name, order: .reverse),
                                    SortDescriptor(\Prospect.name)
                                ])
                        }
                    }
                }  
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingScanner = true
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                if !selectedProspects.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: delete) {
                            Text("Delete Selected")
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Name: Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
    }
    
    init(filter: FilterType, sortOrder: Binding<[SortDescriptor<Prospect>]>) {
        self.filter = filter
        self._sortOrder = sortOrder

        guard filter != .none else {
            _prospects = Query(sort: sortOrder.wrappedValue)
            return
        }

        let showContactedOnly = filter == .contacted
        _prospects = Query(filter: #Predicate {
            $0.isContacted == showContactedOnly
        }, sort: sortOrder.wrappedValue)
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }            
            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            modelContext.insert(person)
        case .failure( let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            //Testing purposes
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content , trigger: trigger)
            
            center.add(request)
            
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { 
                    success, error in 
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectsView(filter: .none, sortOrder: .constant([SortDescriptor(\Prospect.name)]))
        .modelContainer(for: Prospect.self)
}
