//
//  ItemRow.swift
//  Restaurant
//
//  Created by Ratnesh Shukla on 30/07/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "S": .blue, "V": .green, "N" : .red]
    var body: some View {
        HStack {
            Image(item.thumbnailImage).clipShape(Circle())
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text("$ \(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(self.colors[restriction])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
