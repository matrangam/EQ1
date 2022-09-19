import SwiftUI

enum LoadingState {
    case notStarted
    case inProgress
    case success([Earthquake])
    case failed(Error)
}

struct ContentView: View {
    @State var loadingState: LoadingState = .notStarted

    var body: some View {
        VStack {
            switch loadingState {
            case .notStarted:
                VStack {
                    Button("Get Quakes") {
                        Task {
                            await getQuakes()
                        }
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            case .inProgress:
                ProgressView()
                    .padding()
            case let .success(earthquakes):
                List {
                    ForEach(earthquakes) { quake in
                        Text(quake.title)
                    }
                }
                .refreshable {
                    Task {
                        await getQuakes()
                    }
                }
            case let .failed(error):
                Text("Something went wrong: \(error.localizedDescription)")
            }
        }
        .padding()
    }

    func getQuakes() async {
        do {
            loadingState = .inProgress
            let earthquakes = try await QuakeClient.failing.fetchQuakes()
            loadingState = .success(earthquakes)
        } catch {
            print(error)
            loadingState = .failed(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
