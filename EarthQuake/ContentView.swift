//
//  ContentView.swift
//  EQ2
//
//  Created by Michael Matranga on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Get Quakes") {
                Task {
                    await getQuakes()
                }
            }
        }
        .padding()
    }

    func getQuakes() async {
        do {
            let result = try await QuakeClient.live.fetchQuakes()
            print(result)
        } catch {
            print(error)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
