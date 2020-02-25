//
//  ContentView.swift
//  WeSplit
//
//  Created by nic Wanavit on 2/25/20.
//  Copyright © 2020 tenxor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var currencyChoice = 0
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    let currencySymbols = ["$", "£","€", "¥"]
    
    var currency: String {
        return currencySymbols[currencyChoice]
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[self.tipPercentage])
        let grossTotal = Double(self.checkAmount) ?? Double(0)
        return (grossTotal * ( 1 + tipSelection / 100)) / peopleCount
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[self.tipPercentage])
        let grossTotal = Double(self.checkAmount) ?? Double(0)
        return (grossTotal * ( 1 + tipSelection / 100))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("how much does it cost in total")) {
                    TextField("Total cost", text: $checkAmount)
                        .keyboardType(.numberPad)
                    Picker("Currency", selection: $currencyChoice) {
                        ForEach(0 ..< currencySymbols.count){
                            Text("\(self.currencySymbols[$0])")
                        }
                    }
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0 ..< 100){
                            Text("\($0) \($0 == 0 ? "": $0 == 1 ? "person" : "people" )")
                        }
                    }
                }
                
                Section(header: Text("how much tips you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("the total amount is \(self.currency)\(self.grandTotal, specifier: "%.2f")")
                    Text("the amount per person is \(self.currency)\(self.totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
