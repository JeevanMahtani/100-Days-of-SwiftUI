import SwiftUI

struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Toggle Details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details are shown!")
                    .transition(.move(edge: .bottom))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
