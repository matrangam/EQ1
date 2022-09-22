import MapKit
import SwiftUI

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.71, longitude: 117.16),
        span: MKCoordinateSpan(latitudeDelta: 100.0, longitudeDelta: 100.0)
    )
    @ObservedObject var viewModel = MapViewModel()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: viewModel.earthquakes) { quake in
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
            .onAppear(perform: {
                Task { await getQuakes() }
            })
            switch viewModel.loadingState {
            case .inProgress:
                ProgressView()
            default:
                EmptyView()
            }
        }
    }

    @MainActor func getQuakes() async {
        await viewModel.refreshEarthquakes()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
