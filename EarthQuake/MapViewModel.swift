import Foundation
import SwiftUI

enum LoadingState {
    case notStarted
    case inProgress
    case success([Earthquake])
    case failed(Error)
}

class MapViewModel: ObservableObject {
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
