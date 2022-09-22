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
                LineChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
                .padding()
                
                BarChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesSales.salesPerCategory
                )
                .padding()
                
                ScatterChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
                    .padding()
            }
            
            HStack {
                LineChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
                .padding()
                
                BarChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesSales.salesPerCategory
                )
                .padding()
                
                ScatterChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
                    .padding()
            }
            
            HStack {
                LineChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
                .padding()
                
                BarChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesSales.salesPerCategory
                )
                .padding()
                
                ScatterChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesSales.totalSales
                )
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
