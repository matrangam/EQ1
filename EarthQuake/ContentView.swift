import SwiftUI

struct ContentView: View {
    @State var earthquakes: [Earthquake] = []
    @State var loadingQuakes = false

    var body: some View {
        VStack {
            Button("Get Quakes") {
                Task {
                    await getQuakes()
                }
            }
            Spacer()
            if loadingQuakes {
                ProgressView()
                    .padding()
            } else {
                List {
                    ForEach(earthquakes) { quake in
                        Text(quake.title)
                    }
                }
            }
        }
        .padding()
    }

    func getQuakes() async {
        do {
            loadingQuakes = true
            earthquakes = try await QuakeClient.live.fetchQuakes()
            loadingQuakes = false
        } catch {
            print(error)
            loadingQuakes = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
