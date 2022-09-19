import Foundation

struct QuakeClient {
    var fetchQuakes: () async throws -> QuakeResponse
}

extension QuakeClient {
    static let live = Self {
        let endpoint: String = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
        guard let url = URL(string: endpoint) else {
            preconditionFailure()
        }
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(QuakeResponse.self, from: data)

        
        return response
    }
}
