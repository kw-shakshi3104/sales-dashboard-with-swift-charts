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
                    salesAmount: pancakesData.totalSales,
                    chartTitle: "Total Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    isShowAverage: isShowAverage
                )
                .padding()
                .onTapGesture {
                    isShowAverage.toggle()
                }
                
                BarChart(
                    salesAmount: pancakesData.totalSales,
                    chartTitle: "Total Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales"
                )
                .padding()
                
                ScatterChart(
                    salesAmount: pancakesData.totalSales,
                    chartTitle: "Total Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales"
                )
                    .padding()
            }
            
            HStack {
                AreaChart(
                    salesAmount: pancakesData.salesPerCategory,
                    chartTitle: "Sales per Topping",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                .padding()
                
                BarChart(
                    salesAmount: pancakesData.salesPerCategory,
                    chartTitle: "Sales per Topping",
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
