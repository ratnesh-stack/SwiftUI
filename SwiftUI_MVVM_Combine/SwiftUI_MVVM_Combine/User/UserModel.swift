//
//  UserModel.swift
//  SwiftUI_MVVM_Combine
//
//  Created by Ratnesh Shukla on 09/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct UserModel: Identifiable, Decodable {
    let id = UUID()
    let firstname: String
    let lastname: String
    let email: String
    let avatarUrl: String
}
