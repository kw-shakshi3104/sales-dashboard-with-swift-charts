//
//  ContentView.swift
//  Dashboard
//


import SwiftUI
import Charts

struct ContentView: View {
    private let salesAmount = getSalesAmount(color: .blue)
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Sales Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            HStack {
                LineChart(salesAmount: salesAmount)
                .padding()
                
                BarChart(salesAmount: salesAmount)
                .padding()
            }
            
            HStack {
                LineChart(salesAmount: salesAmount)
                .padding()
                
                BarChart(salesAmount: salesAmount)
                .padding()
            }
            
            HStack {
                LineChart(salesAmount: salesAmount)
                .padding()
                
                BarChart(salesAmount: salesAmount)
                .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
