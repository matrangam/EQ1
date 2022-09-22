import SwiftUI

struct EarthquakeListView: View {
    @ObservedObject var viewModel = EarthquakeListViewModel()

    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.earthquakes) { quake in
                    VStack {
                        Text(quake.title)
                        Text(quake.place)
                        Text("\(quake.formattedMag)")
                    }
                }
            }
            switch viewModel.loadingState {
            case .inProgress:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .onAppear(perform: {
            Task { await getQuakes() }
        })
    }

    @MainActor func getQuakes() async {
        await viewModel.refreshEarthquakes()
    }
}

struct EarthquakeListView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeListView()
    }
}
