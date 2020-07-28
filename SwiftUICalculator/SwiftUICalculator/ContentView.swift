//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by Ratnesh Shukla on 26/07/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, decimal, one, two, three, four, five, six, seven, eight, nine
    case ac, plusMinus, percent
    case equal, plus, minus, multiply, devide
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .decimal: return "."
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
            
        case .ac: return "AC"
        case .plusMinus: return "+/-"
        case .percent: return "%"
            
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .devide: return "/"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .decimal, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine: return Color(.darkGray)
        case .ac, .plusMinus, .percent: return Color(.lightGray)
        default:
            return Color(.orange)
        }
    }
}

class GlobalEnvironment: ObservableObject {
    @Published var display = ""
    
    func receiveInput(calculator: CalculatorButton) {
        self.display = calculator.title
    }
}

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white).font(.system(size: 64))
                }.padding()

                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id:\.self) { button in
                            CalculatorView(button: button)
                        }
                    }
                }
            }
        }
    }
    
}

struct CalculatorView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    var button: CalculatorButton
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(calculator: self.button)
        }) {
            Text(button.title).font(.system(size: 32))
                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5*12) / 4)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4*12)/4 * 2
        }
        return (UIScreen.main.bounds.width - 5*12) / 4
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
