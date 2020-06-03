//
//  ContentView.swift
//  TempConverter
//
//  Created by Jacob Singer on 10/31/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State var inputUnit = 0
    @State var outputUnit = 0
    @State var initTemp = ""
    
    let inputUnitTypes = ["Fahrenheit", "Celcius", "Kelvin"]
    let outputUnitTypes = ["Fahrenheit", "Celcius", "Kelvin"]
    

    
    var goodNum: Double {
        let goodTemp = Double(initTemp) ?? 0
        
        return goodTemp
    }
       
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    
                    TextField("Temperature you want to convert", text: $initTemp)
                    
                    Picker("Select unit type", selection: $inputUnit) {
                        
                        ForEach(0..<inputUnitTypes.count){
                            
                            Text("\(self.inputUnitTypes[$0])")
                        }
                        
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted temperature unit")){
                    
                    Picker("Select unit you want to convert to", selection: $outputUnit) {
                        
                        ForEach(0..<outputUnitTypes.count){
                            
                            Text("\(self.outputUnitTypes[$0])")
                            
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                
                    
              
                  
                 
                    
                    
                    
                    
                    
                }
                Section{
                    
                //Conditions
                    
                    if inputUnit == outputUnit {
                        
                        Text("\(goodNum, specifier: "%.2f")")
                        
                    }
                    
                    if inputUnit == 0 && outputUnit == 1 {
                        
                        Text("\((((goodNum - 32)*5)/9),specifier: "%.2f")°C")
                        
                    }
                    
                }
                
                
                
                
                
                
                
                
                
                
            }
            .navigationBarTitle("TempConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
