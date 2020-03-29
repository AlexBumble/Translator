//
//  WordsMeaningViewModel.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import SwiftUI
import Combine

final class WordsMeaningViewModel: ObservableObject {
    
    @Published private(set) var meaning: [Meaning]
    @Published private(set) var image: UIImage?
    @Published private(set) var isImageLoading: Bool = false
    private var disposables = Set<AnyCancellable>()
    
    init(meanings: [Meaning]) {
        self.meaning = meanings
        $meaning
            .sink (receiveValue: { searchText in
                self.loadImage(path: meanings[0].imageUrl)
            })
            .store(in: &disposables)
    }
    
    func loadImage(path: String?) {
        if isImageLoading == false {
            isImageLoading = true
            let scheme = "https:"
            guard
                let path = path,
                let url = URL(string: scheme + path) else
            {
                image = UIImage(systemName: "questionmark")
                isImageLoading = false
                return
            }
            
            if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
                image = UIImage(data: cachedResponse.data)
                isImageLoading = false
                return
            }
            
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let data = data, let response = response {
                        self.image = UIImage(data: data)
                        self.handleLoadedImage(data: data, response: response)
                        self.isImageLoading = false
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl ))
    }
    
}
