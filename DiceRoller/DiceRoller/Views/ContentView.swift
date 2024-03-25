//
//  ContentView.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftUI
import Combine
import CoreHaptics


struct GradientBackground: View {
    var body: some View {
        Color(UIColor.systemBackground)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @State private var showSettings = false
    @State private var viewModel = GameViewModel()
    @State private var start = false
    @State private var timeRemaining = 1.2
    @State private var engine: CHHapticEngine?
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {   
        TabView {
        
            GameSettings(viewModel: viewModel)
                .tabItem { 
                    Label("Settings", systemImage: "gearshape")
                }
            
            ZStack {
                GradientBackground()
                VStack {
                    
                    Spacer()
                    VStack{
                        Text("Roll result:")
                            .font(.largeTitle)
                        Text("\(viewModel.result)")
                            .font(.title)
                            .foregroundStyle(.red)
                            .bold()
                        
                        Spacer()
                        
                        VStack {
                            HStack{
                               OctahedronShape() 
                                    .scaleEffect(0.5)
                                    .offset(x: start ? 30 : 0)
                                    
                               OctahedronShape() 
                                    .scaleEffect(0.5)
                                    .offset(x: start ? 30 : 0)
                                  
                            }
                            .offset(y: -30)
                            if viewModel.sides == 6 {
                                
                                switch(viewModel.numOfDice) {
                                case 2:
                                    HStack {
                                        SixSidedDice(number: $viewModel.firstDisplayedNumber, width: 80, height: 80)
                                            .offset(x: start ? 30 : 0)
                                        
                                        Spacer()
                                            .frame(width: 20)
                                        
                                        SixSidedDice(number: $viewModel.secondDisplayedNumber, width: 80, height: 80)
                                            .offset(x: start ? 30 : 0)
                                    } 
                                default:
                                    SixSidedDice(number: $viewModel.firstDisplayedNumber, width: 150, height: 150)
                                        .offset(x: start ? 30 : 0)
                                }
                            } else {
                                switch(viewModel.numOfDice) {
                                case 2:
                                    HStack {
                                        FourSidedDice(number: $viewModel.firstDisplayedNumber, width: 80, height: 80)
                                            .offset(x: start ? 30 : 0)
                                        
                                        Spacer()
                                            .frame(width: 20)
                                        
                                        FourSidedDice(number: $viewModel.secondDisplayedNumber, width: 80, height: 80)
                                            .offset(x: start ? 30 : 0)
                                    } 
                                default:
                                    FourSidedDice(number: $viewModel.firstDisplayedNumber, width: 150, height: 150)
                                        .offset(x: start ? 30 : 0)
                                } 
                            }                               
                        }
                        .frame(width: 350,height: 300 )
                        //  .border(.blue)
                        
                        Button("Roll", action: rollDice) 
                        
                            .frame(width: 170)
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(.black)
                            .clipShape(.capsule)
                        
                     
                        
                        Spacer()      

                        Spacer()
                        
                    }
                    .frame(width: 350)
                    .frame(height: 600)
                    .background(.white)
                    //.border(.green)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    
                    
                    Spacer()                         
                    Spacer()
                }
                
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //   .border(.red)
                // .background(.gray)
                
                .preferredColorScheme(.light)
                .onAppear(perform: prepareHaptics)
            }
            .tabItem { 
                Label("Play", systemImage: "dice")
                    .foregroundStyle(.white)
            }
            
            RollResultsView()
                .tabItem {
                    Label("Scores", systemImage: "list.number")
                }
        }
    }
    
    private func rollDice() {
        start = true        
        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.08, blendDuration: 0.2)) {            
            roll()
            start = false
        }

    }
    
    private func roll() {
        timeRemaining = 1.2
        let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        var cancellable: AnyCancellable?
        
        diceRollHaptics()
        
        cancellable = timer.sink { _ in
            timeRemaining -= 0.2
            viewModel.firstDisplayedNumber = Int.random(in: 1...viewModel.sides)
            viewModel.secondDisplayedNumber = Int.random(in: 1...viewModel.sides)
                        
            if viewModel.numOfDice > 1 {
                viewModel.result =  viewModel.firstDisplayedNumber + viewModel.secondDisplayedNumber
            } else {
                viewModel.result = viewModel.firstDisplayedNumber
            }
            
            if timeRemaining <= 0 {
                cancellable?.cancel()
                saveResult()
            }
        }
    }
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    private func saveResult() {
        let result = DiceResult(result: viewModel.result, numOfDice: viewModel.numOfDice, rollDate: DateManager.currentDateAsString)
        
        modelContext.insert(result)
    }
    
    private func diceRollHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1.2, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
