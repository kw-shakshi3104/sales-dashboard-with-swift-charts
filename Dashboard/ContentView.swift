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
            HStack {
                Text("Sales Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
                .padding()
            }
            
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
                .padding()
            }
            
            HStack {
                LineChart(salesAmount: pancakesSales.totalSales)
                .padding()
                
                BarChart(salesAmount: pancakesSales.salesPerCategory)
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
