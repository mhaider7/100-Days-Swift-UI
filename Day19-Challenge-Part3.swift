import SwiftUI

struct ContentView: View {
    @State private var initialValue = 0.0
    @State private var selectedUnits = 0 // Creates an order??
    @State private var initialUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.kilometers
    @FocusState private var amountIsFocused: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    
    let unitTypes = [
        [UnitLength.feet, UnitLength.meters, UnitLength.kilometers, UnitLength.yards, UnitLength.miles],
        [UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds, UnitMass.grams],
        [UnitTemperature.fahrenheit, UnitTemperature.kelvin, UnitTemperature.celsius],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
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
                    Picker("Conversions", selection: $selectedUnits) {
                        ForEach(0..<conversions.count) {
                            Text(conversions[$0])
                        }
                    }
                } header: {
                    Text("Conversion type")
                }
                
                Section {
                    Picker("Units", selection: $initialUnit) {
                        ForEach(unitTypes[selectedUnits], id: \.self) { // Notice the order when attaching selectedUnits to unitTypes array
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
                        ForEach(unitTypes[selectedUnits], id: \.self) {
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
            // ????
                .onChange(of: selectedUnits) { newSelection in
                    let units = unitTypes[newSelection]
                    initialUnit = units[0]
                    outputUnit = units[1]
                }
        }
    }
    
    init () {
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

