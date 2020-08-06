//
//  CheckoutView.swift
//  Restaurant
//
//  Created by Ratnesh Shukla on 03/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyaly card")
                }
                if addLoyaltyDetails {
                    TextField("iDine Id", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add Tip")) {
                Picker("Percent", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count)  {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total Price: $\(totalPrice, specifier: "% .2f")")) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"),
                  message: Text("Total was $\(totalPrice, specifier: "% .2f") "),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
