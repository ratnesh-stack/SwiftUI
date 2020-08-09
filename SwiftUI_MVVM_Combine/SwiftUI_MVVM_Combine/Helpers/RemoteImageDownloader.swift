//
//  RemoteImageDownloader.swift
//  SwiftUI_MVVM_Combine
//
//  Created by Ratnesh Shukla on 09/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

class RemoteImageDownloader: ObservableObject {
    @Published var imageData = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageData = data
            }
        }
    }
}
