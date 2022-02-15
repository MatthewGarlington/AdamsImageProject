//
//  NetworkManager.swift
//  AdamNetworkingProject
//
//  Created by Matthew Garlington on 2/14/22.
//

import SwiftUI
import Combine



class NetworkManager: ObservableObject {
    @Published var imageModel: ImageModel?
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://api.waifu.pics/sfw/waifu")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ImageModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                 print("Details: \(error.localizedDescription)")
                }
            }, receiveValue: { [unowned self] image in
                imageModel = image
            })
            .store(in: &cancellables)
    }
}
