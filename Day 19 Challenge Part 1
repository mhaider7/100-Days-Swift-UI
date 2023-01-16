import SwiftUI

struct ContentView: View {
    @State private var initialValue = 0.0
    @State private var initialUnit = "Meters"
    @State private var outputUnit = "Kilometers"
    @FocusState private var amountIsFocused: Bool
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var result: String {
        let inputMultiplier: Double
        let outputMultiplier: Double
        
        switch initialUnit { // Unit to meters
        case "Feet":
            inputMultiplier = 0.3048
        case "Kilometers":
            inputMultiplier = 1000
        case "Yards":
            inputMultiplier = 0.9144
        case "Miles":
            inputMultiplier = 1609.34
        default:
            inputMultiplier = 1.0
        }
        
        switch outputUnit { // Meters to unit
        case "Feet":
            outputMultiplier = 3.28084
        case "Kilometers":
            outputMultiplier = 0.001
        case "Yards":
            outputMultiplier = 1.09361
        case "Miles":
            outputMultiplier = 0.000621371
        default:
            outputMultiplier = 1.0
        }
        
        let inputResult = initialValue * inputMultiplier
        let outputResult = inputResult * outputMultiplier
        
        
        let outputValue = outputResult.formatted() // Formatted takes away all the extra decimals
        return "\(outputValue) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Units", selection: $initialUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Amount", value: $initialValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Convert from")
                }
            
                Section {
                    Picker("Units", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                    }
                }
                    Text(result)
                } header: {
                    Text("Convert to")
                }
            } .navigationTitle("Unit Conversion")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
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
