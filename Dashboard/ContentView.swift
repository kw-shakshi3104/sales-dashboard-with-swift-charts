//
//  ContentView.swift
//  Dashboard
//


import SwiftUI
import Charts

struct ContentView: View {
    private var pancakesSales = PancakesSalesAmount()
        
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Sales Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            // Charts
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
                .padding()
                
                ScatterChart(salesAmount: pancakesSales.totalSales)
                    .padding()
            }
            
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
                .padding()
                
                ScatterChart(salesAmount: pancakesSales.totalSales)
                    .padding()
            }
            
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
                .padding()
                
                ScatterChart(salesAmount: pancakesSales.totalSales)
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
