//
//  AppView.swift
//  Restaurant
//
//  Created by Ratnesh Shukla on 03/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {Image(systemName: "list.dash"); Text("Menu")}
            OrderView().tabItem {Image(systemName: "square.and.pencil"); Text("Order")}
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
