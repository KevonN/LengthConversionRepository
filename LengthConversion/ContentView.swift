//
//  ContentView.swift
//  LengthConversion
//
//  Created by Kevin Nguyen on 7/10/23.
//

import SwiftUI
struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}


struct ContentView: View {
    @State private var input = 0.0
    @State private var inputUnit = "Km"
    let units = ["Km", "Ft", "Yd", "Mi"]
    @State private var outputUnit = "Km"
    
    var conversion: Double {
        var meter = 0.0
        switch inputUnit {
        case "Km":
            meter = input * 1000
        case "Ft":
            meter = input / 3.281
        case "Yd":
            meter = input / 1.094
        case "Mi":
            meter = input * 1609
        default:
            meter = -1.0
        }
        
        var output: Double
        switch outputUnit {
        case "Km":
            output = meter / 1000
            return output
        case "Ft":
            output = meter * 3.281
            return output
        case "Yd":
            output = meter * 1.094
            return output
        case "Mi":
            output = meter / 1609
            return output
        default:
            return -2.0
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                // Input Section
                Section {
                    TextField("Starting Value", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                    
                        Picker("Units", selection: $inputUnit)
                        {
                            ForEach(units, id: \.self)
                            {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                }
                header:
                {
                    Text("Input:")
                }
                
                // Output Units
                Section {
                    
                    Picker("Units", selection: $outputUnit)
                    {
                        ForEach(units, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                header:
                {
                    Text("Output Units:")
                }
                
                // Output Value
                Section {
                    Text(conversion, format: .number)
                }
                header:
                {
                    Text("Output:")
                        .modifier(BlueTitle())
                }

            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
