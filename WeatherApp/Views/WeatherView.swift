//
//  WeatherView.swift
//  WeatherApp
//
//  Created by DuyLe on 7/26/26.
//

import SwiftUI

struct WeatherView: View {
    @State private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 4) {
                TextField("Enter city name ", text: $vm.city)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button {
                    // TODO: Fetch Weather from API
                } label: {
                    Label("Get Weather", systemImage: "cloud.sun.fill")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                if vm.isLoading {
                    ProgressView("Fetching ...")
                        .padding()
                } else if let weather = vm.weather {
                    // TODO: display weather card
                    Text("Display Weather Card")
                } else if let error = vm.errorMessage {
                    Text(error).foregroundStyle(.red)
                }
                
                Spacer()
            }
            .navigationTitle("Weather App")
        }
    }
}

#Preview {
    WeatherView()
}
