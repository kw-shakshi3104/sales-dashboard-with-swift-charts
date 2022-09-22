//
//  ContentView.swift
//  Dashboard
//


import SwiftUI
import Charts

struct ContentView: View {
    private var pancakesData = PancakesData()
    @State private var isShowAverage = false
        
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
                    salesAmount: pancakesData.totalSales,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    isShowAverage: isShowAverage
                )
                .padding()
                .onTapGesture {
                    isShowAverage.toggle()
                }
                
                BarChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesData.totalSales,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales"
                )
                .padding()
                
                ScatterChart(
                    chartTitle: "Total Sales",
                    salesAmount: pancakesData.totalSales,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales"
                )
                    .padding()
            }
            
            HStack {
                AreaChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesData.salesPerCategory,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                .padding()
                
                BarChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesData.salesPerCategory,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                .padding()
                
                ScatterChart(
                    chartTitle: "Sales per Topping",
                    salesAmount: pancakesData.salesPerCategory,
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
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
