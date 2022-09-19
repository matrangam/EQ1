import MapKit
import SwiftUI

enum LoadingState {
    case notStarted
    case inProgress
    case success([Earthquake])
    case failed(Error)
}

struct ContentView: View {
    @State private var loadingState: LoadingState = .notStarted
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.71, longitude: 117.16),
        span: MKCoordinateSpan(latitudeDelta: 100.0, longitudeDelta: 100.0)
    )
    @State private var earthquakes: [Earthquake] = []

    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: earthquakes) { quake in
                MapAnnotation(coordinate: quake.location()) {
                    ZStack {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                            .onTapGesture {
                                print("Tapped on \(quake)")
                            }
                        Text("\(quake.mag)")
                    }
                }
            }
            .ignoresSafeArea()
            VStack {
                Button("Get Quakes") {
                    Task { await getQuakes() }
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }

    @MainActor func getQuakes() async {
        do {
            loadingState = .inProgress
            earthquakes = try await QuakeClient.live.fetchSignificantQuakes()
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
