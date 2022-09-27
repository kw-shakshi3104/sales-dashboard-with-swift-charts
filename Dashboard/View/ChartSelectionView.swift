//
//  ChartSelectionView.swift
//  Dashboard
//

import SwiftUI

enum ChartType: String, CaseIterable {
    case line = "Line Chart"
    case bar = "Bar Chart"
    case barTranspose = "Bar Chart (Transpose)"
    case scatter = "Scatter Chart"
    case area = "Area Chart"
    case heatMap = "Heat Map"
}

struct ChartSelectionView: View {
    @State private var selectedChart: ChartType?
    var pancakesData = PancakesData()
    
    var body: some View {
        if let selectedChart {
            Group {
                switch selectedChart {
                case .line:
                    LineChart(
                        salesAmount: pancakesData.dailySales,
                        chartTitle: "Daily Sales",
                        xAxisLabel: "Date",
                        yAxisLabel: "Sales"
                    )
                    .padding()
                case .bar:
                    BarChart(
                        salesAmount: pancakesData.dailySales,
                        chartTitle: "Daily Sales",
                        xAxisLabel: "Date",
                        yAxisLabel: "Sales"
                    )
                    .padding()
                case .barTranspose:
                    BarChartTranspose(
                        salesAmount: pancakesData.totalSalesPerCategory,
                        
                        chartTitle: "Total Sales per Topping",
                        xAxisLabel: "Sales",
                        yAxisLabel: "Topping",
                        legendTitle: "Topping"
                    )
                    .padding()
                case .scatter:
                    ScatterChart(
                        salesAmount: pancakesData.dailySales,
                        chartTitle: "Daily Sales",
                        xAxisLabel: "Date",
                        yAxisLabel: "Sales"
                    )
                    .padding()
                case .area:
                    AreaChart(
                        salesAmount: pancakesData.dailySalesPerCategory,
                        chartTitle: "Daily Sales per Topping",
                        xAxisLabel: "Date",
                        yAxisLabel: "Sales",
                        legendTitle: "Topping"
                    )
                    .padding()
                case .heatMap:
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
            .onLongPressGesture {
                self.selectedChart = nil
            }
        } else {
            Menu {
                ForEach(ChartType.allCases, id: \.self) { chart in
                    Button {
                        selectedChart = chart
                    } label: {
                        Text(chart.rawValue)
                    }
                }
            } label: {
                Image(systemName: "plus.square")
            }
        }
    }
}

struct ChartSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ChartSelectionView()
    }
}
