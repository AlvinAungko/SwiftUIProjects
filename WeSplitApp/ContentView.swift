//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Aung Ko Ko on 20/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isCheckAmountFocused
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let listOfPeople = [2, 4, 6]
    
    var totalAmountPerPerson: Double {
        let tipAmount = (checkAmount / 100) * Double(tipPercentage)
        let grandTotal = checkAmount + tipAmount
        return grandTotal/Double(numberOfPeople)
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.numberPad)
                    .focused($isCheckAmountFocused)
            } header: {
                Text("Enter Your Amount")
            }
            
            
            Section {
                Picker("Select People", selection: $numberOfPeople) {
                    ForEach(listOfPeople, id: \.self) {
                        Text("\($0) people")
                    }
                }
            } header: {
                Text("Enter the amount of People")
            }
            
            Section {
                Picker("Select your tip", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            } header: {
                Text("Enter your tip")
            }
            
            Section {
                Text(totalAmountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isCheckAmountFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
