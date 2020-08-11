//
//  UserViewModel.swift
//  SwiftUI_MVVM_Combine
//
//  Created by Ratnesh Shukla on 11/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

let apiUrl = "https://my.api.mockaroo.com/users.json?key=6dd6d8b0"

class UserViewModel: ObservableObject {
    @Published var users = [UserModel]()
    
    func fetchUsers() {
        users.removeAll()
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.users = try! JSONDecoder().decode([UserModel].self, from: data)
                }
            }
        }.resume()
        
    }
}
