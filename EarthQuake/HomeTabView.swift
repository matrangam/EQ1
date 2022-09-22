import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            VStack {
                Text("This is the list")
            }
                .tabItem {
                    Label("List", systemImage: "list.star")
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
