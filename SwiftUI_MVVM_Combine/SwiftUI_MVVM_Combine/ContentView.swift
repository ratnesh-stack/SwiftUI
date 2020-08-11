//
//  ContentView.swift
//  SwiftUI_MVVM_Combine
//
//  Created by Ratnesh Shukla on 09/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let users = [UserModel]()
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            List(userViewModel.users) { user in
                RowView(user: user).frame(height: 250)
            }
            Button(action: {
                self.userViewModel.fetchUsers()
            }, label: {
                ZStack {
                    Rectangle().frame(width: 120, height: 40).foregroundColor(.blue).cornerRadius(10)
                    Text("Fetch").foregroundColor(.white)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
