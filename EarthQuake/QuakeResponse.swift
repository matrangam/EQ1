import Foundation

struct QuakeResponse: Codable {
    let type: String
    let metadata: QuakeResponseMetadata
    let features: [QuakeResponseFeature]
}

struct QuakeResponseMetadata: Codable {
    let title: String
    let count: Int32
    let generated: TimeInterval
    let api: String
}

struct QuakeResponseFeature: Codable {
    let properties: QuakeResponseFeatureProperties
    let geometry: QuakeResponseFeatureGeometry
}

struct QuakeResponseFeatureProperties: Codable {
    let mag: Double
    let place: String
    let time: TimeInterval
    let updated: TimeInterval
    let title: String
    let type: String
}

struct QuakeResponseFeatureGeometry: Codable {
    let type: String
    let coordinates: [Double]
    let id: String?
}
