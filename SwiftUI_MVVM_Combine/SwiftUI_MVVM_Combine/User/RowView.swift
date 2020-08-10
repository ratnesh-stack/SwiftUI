//
//  RowView.swift
//  SwiftUI_MVVM_Combine
//
//  Created by Ratnesh Shukla on 10/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var user: UserModel
    @ObservedObject var remoteImageUrl: RemoteImageDownloader
    
    init(user: UserModel) {
        self.user = user
        remoteImageUrl = RemoteImageDownloader(imageUrl: user.avatarUrl)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: self.remoteImageUrl.imageData)!).resizable()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(user: UserModel(firstname: "", lastname: "", email: "", avatarUrl: ""))
    }
}
