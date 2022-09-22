import Foundation
import SwiftUI

class EarthquakeListViewModel: ObservableObject {
    @Published var earthquakes: [Earthquake] = []
    @Published var loadingState: LoadingState = .notStarted

    @MainActor func refreshEarthquakes() async {
        do {
            loadingState = .inProgress
            earthquakes = try await QuakeClient.live.fetchSignificantQuakes()
            loadingState = .success(earthquakes)
        } catch {
            loadingState = .failed(error)
        }
    }
}
