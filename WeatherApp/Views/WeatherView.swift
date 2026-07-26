//
//  WeatherView.swift
//  WeatherApp
//
//  Created by DuyLe on 7/26/26.
//

import SwiftUI
import OSLog

private let logger = Logger(
    subsystem: Bundle.main.bundleIdentifier ?? "WeatherApp",
    category: "WeatherView"
)

struct WeatherView: View {
    @State private var vm = WeatherViewModel()
    
    @AppStorage("useFahrenheit") private var useFahrenheit = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter city name", text: $vm.city)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await vm.fetch()
                    }
                } label: {
                    Label(
                        "Get Weather",
                        systemImage: "cloud.sun.fill"
                    )
                }.buttonStyle(.borderedProminent)
                    .padding()
                    .disabled(vm.city.count < 3)

                if vm.isLoading {
                    ProgressView("Fetching Weather...")
                        .padding()
                } else if let weather = vm.weather {
                    WeatherCard(
                        weather: weather,
                        useFahrenheit: useFahrenheit
                    )
                }
                
                if vm.errorMessage != nil {
                    ErrorMessageView(errorMessage: vm.errorMessage)
                }
                
                
                Spacer()
                
            }
            .onChange(of: vm.isLoading, initial: true) { oldValue, newValue in
                logger.debug("isLoading: \(oldValue) → \(newValue)")
            }
            .navigationTitle("Weather App")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Toggle(isOn: $useFahrenheit) {
                            Label(
                                useFahrenheit ? "Use Celsius" : "Use Fahernheit",
                                systemImage: "thermometer.sun"
                            )
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}
