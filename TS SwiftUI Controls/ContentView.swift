//
//  ContentView.swift
//  TS SwiftUI Controls
//
//  Created by Thomas Sillmann on 27.02.20.
//  Copyright © 2020 Thomas Sillmann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Text")) {
                    NavigationLink(destination: TextFieldView()) {
                        Text("TextField")
                    }
                    NavigationLink(destination: SecureFieldView()) {
                        Text("SecureField")
                    }
                }
                Section(header: Text("Value selectors")) {
                    NavigationLink(destination: ToggleView()) {
                        Text("Toggle")
                    }
                    NavigationLink(destination: PickerView()) {
                        Text("Picker")
                    }
                    NavigationLink(destination: DatePickerView()) {
                        Text("DatePicker")
                    }
                    NavigationLink(destination: SliderView()) {
                        Text("Slider")
                    }
                    NavigationLink(destination: StepperView()) {
                        Text("Stepper")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("SwiftUI-Controls")
        }
    }
}

struct TextFieldView: View {
    @State private var enteredText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Text", text: $enteredText)
            Divider()
            Text(enteredText)
        }
        .navigationBarTitle("TextField")
        .padding()
    }
}

struct SecureFieldView: View {
    @State private var enteredSecureText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SecureField("Secure text", text: $enteredSecureText)
            Divider()
            Text(enteredSecureText)
        }
        .navigationBarTitle("SecureField")
        .padding()
    }
}

struct ToggleView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text("Toggle")
            }
            Divider()
            Text(isOn ? "On" : "Off")
        }
        .navigationBarTitle("Toggle")
        .padding()
    }
}

struct PickerView: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            Group {
                Text("Default picker style")
                    .font(.headline)
                Picker(selection: $selection, label: Text("Default")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                }
            }
            Spacer()
                .frame(height: 20)
            Divider()
            Spacer()
                .frame(height: 20)
            Group {
                Text("Segmented picker style")
                    .font(.headline)
                Picker(selection: $selection, label: Text("Segment")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Spacer()
                .frame(height: 20)
            Divider()
            Spacer()
                .frame(height: 20)
            Text("Selection: \(selection)")
            Spacer()
        }
        .navigationBarTitle("Picker")
        .padding()
    }
}

struct DatePickerView: View {
    @State private var selectedDate = Date()
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
    
    private var formattedDate: String {
        dateFormatter.string(from: selectedDate)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker(selection: $selectedDate, label: { Text("Date and time") })
                DatePicker(selection: $selectedDate, displayedComponents: [.date], label: { Text("Date") })
                DatePicker(selection: $selectedDate, displayedComponents: [.hourAndMinute], label: { Text("Time") })
                Spacer()
                    .frame(height: 20)
                Divider()
                Spacer()
                    .frame(height: 20)
                Text("Selected date: \(formattedDate)")
            }
        }
        .navigationBarTitle("DatePicker")
        .padding()
    }
}

struct SliderView: View {
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            HStack {
                Text("Default slider")
                Slider(value: $sliderValue)
            }
            HStack {
                Text("Configured slider")
                Slider(value: $sliderValue, in: 0 ... 10)
            }
            Divider()
            Text("Slider value: \(sliderValue)")
        }
        .padding()
    }
}

struct StepperView: View {
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Stepper("Default stepper", value: $stepperValue)
            Stepper("Configured stepper (0 - 10)", value: $stepperValue, in: 0 ... 10)
            Divider()
            Text("Stepper value: \(stepperValue)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
