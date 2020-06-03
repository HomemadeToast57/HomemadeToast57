//
//  ContentView.swift
//  WeSplit
//
//  Created by Jacob Singer on 10/10/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State var numPeople = 0
    @State var tipPercentage = 2
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let total = orderAmount + tipValue
        let amountPerPerson = total / peopleCount
        
        return amountPerPerson
                
        
    }
  
    var body: some View {
        NavigationView{
            Form {
                Section{
                    
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numPeople) {
                        ForEach(2 ..< 101) {
                            Text("\($0) people")
                        }.pickerStyle(WheelPickerStyle())
                    }
                }
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f") each person")
    
                }
                
    
                }.navigationBarTitle("WeSplit")
            }
            
        
            
       }
    }

            

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
