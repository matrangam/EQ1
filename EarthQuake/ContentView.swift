import SwiftUI

struct ContentView: View {

    @State var earthquakes: [Earthquake] = []

    var body: some View {
        VStack {
            Button("Get Quakes") {
                Task {
                    await getQuakes()
                }
            }
            List {
                ForEach(earthquakes) { quake in
                    Text(quake.title)
                }
            }
        }
        .padding()
    }

    func getQuakes() async {
        do {
            let result = try await QuakeClient.live.fetchQuakes()
            earthquakes = result
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
