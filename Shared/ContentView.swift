//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Garlington on 2/14/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.purple
                        .ignoresSafeArea()
                    AsyncImage(
                             url: URL(string: networkManager.imageModel?.url ?? ""),
                             content: { image in
                                 image.resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(maxWidth: 600, maxHeight: 800)
                             },
                             placeholder: {
                                 ProgressView()
                             }
                         )
                        .onTapGesture {
                            networkManager.fetch()
                        }
                }
                .onAppear { networkManager.fetch() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
