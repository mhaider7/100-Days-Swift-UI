import SwiftUI

struct ContentView: View {
    @State private var initialValue = 0.0
    @State private var initialUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.meters
    @FocusState private var amountIsFocused: Bool
    
    let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    // Formatter seperated the units by the users choice
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: initialValue, unit: initialUnit) // 100 meters
        let outputMeasurement = inputMeasurement.converted(to: outputUnit) // converted to output units
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Units", selection: $initialUnit) {
                        ForEach(units, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
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
                            Text(formatter.string(from: $0).capitalized)
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
    
    init() { // Cutson initializer for the number format??
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
