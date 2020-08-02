//
//  OrderView.swift
//  Restaurant
//
//  Created by Ratnesh Shukla on 03/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach(order.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: Text("CheckOut")) {
                        Text("Place Order")
                    }
                }
            }.navigationBarTitle("Order").listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
