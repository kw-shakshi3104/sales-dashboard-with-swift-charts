//
//  ContentView.swift
//  Dashboard
//


import SwiftUI
import Charts

struct ContentView: View {
    private var pancakesData = PancakesData()
    @State private var showLineChartAverage = false
    @State private var showBarChartAverage = false
        
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
                    salesAmount: pancakesData.dailySales,
                    chartTitle: "Daily Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    showAverage: showLineChartAverage
                )
                .padding()
                .onTapGesture {
                    showLineChartAverage.toggle()
                }
                
                BarChart(
                    salesAmount: pancakesData.dailySales,
                    chartTitle: "Daily Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    showAverage: showBarChartAverage
                )
                .padding()
                .onTapGesture {
                    showBarChartAverage.toggle()
                }
                
                ScatterChart(
                    salesAmount: pancakesData.dailySales,
                    chartTitle: "Daily Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales"
                )
                .padding()
                
                BarChartTranspose(
                    salesAmount: pancakesData.totalSalesPerCategory,
                                  
                    chartTitle: "Total Sales per Topping",
                                  
                    xAxisLabel: "Sales",
                    yAxisLabel: "Topping", legendTitle: "Topping")
                .padding()
            }
            
            HStack {
                AreaChart(
                    salesAmount: pancakesData.dailySalesPerCategory,
                    chartTitle: "Daily Sales per Topping",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                .padding()
                
                BarChart(
                    salesAmount: pancakesData.dailySalesPerCategory,
                    chartTitle: "Daily Sales per Topping",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                .padding()
                
                HeatMap(
                    salesCount: pancakesData.salesCategoryVsStore,
                    chartTitle: "Topping vs. Store",
                    xAxisLabel: "Topping",
                    yAxisLabel: "Store",
                    legendTitle: "Sales"
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
