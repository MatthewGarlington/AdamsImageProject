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
        ZStack(alignment: .bottom) {
            // This is Code for productiton
            
            //                    AsyncImage(
            //                             url: URL(string: networkManager.imageModel?.url ?? ""),
            //                             content: { image in
            //                                 image.resizable()
            //                                      .aspectRatio(contentMode: .fill)
            //                                      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            //                                      .ignoresSafeArea()
            //                             },
            //                             placeholder: {
            //                                 ProgressView()
            //                             }
            //                         )
            
            // Preview Video
            Image("girl")
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            //.ignoresSafeArea()
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                .frame(height: 350)
            
            if UIScreen.main.bounds.width >= 600 {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            // Some Code
                        } label: {
                            Image(systemName: "square.and.arrow.down.on.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(40)
                    }
                    Spacer()
                        .frame(width: 75, height: 75)
                }
            } else {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            // Some Code
                        } label: {
                            Image(systemName: "square.and.arrow.down.on.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 75, height: 75)
                }
            }
            
        }
        .onTapGesture {
            networkManager.fetch()
            print(UIScreen.main.bounds.width)
        }
        .onAppear { networkManager.fetch() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
