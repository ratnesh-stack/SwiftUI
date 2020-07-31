//
//  ItemDetails.swift
//  Restaurant
//
//  Created by Ratnesh Shukla on 31/07/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    var item: MenuItem
    var body: some View {
        VStack {
            Image(item.mainImage)
            Text(item.description)
        }.navigationBarTitle(item.name)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
    }
}
