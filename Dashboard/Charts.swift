//
//  Charts.swift
//  Dashboard
//


import Foundation
import SwiftUI
import Charts

// MARK: - Chart Protocol
protocol ChartView {
    /// Chart title
    var chartTitle: String? { get }
    /// x-axis label
    var xAxisLabel: String { get }
    /// y-axis label
    var yAxisLabel: String { get }
    /// Ledgend title
    var legendTitle: String? { get }
}

// MARK: - Extension
extension View {
    @ViewBuilder func `condition`<Content: View>(@ViewBuilder _ transform: (Self) -> Content) -> some View {
        transform(self)
    }
}

// MARK: - Line Chart
struct LineChart: View, ChartView {
    var salesAmount: [any SalesData]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var showAverage: Bool = false
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                if showAverage {
                    lineMarks()
                        .foregroundStyle(.gray.opacity(0.5))
                        .interpolationMethod(.catmullRom)
                    
                    let average: Double = Double(salesAmount.reduce(0) { $0 + $1.sales }) / Double(salesAmount.count)
                    RuleMark(
                        y: .value("Average", average)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 3))
                } else {
                    lineMarks()
                        .interpolationMethod(.catmullRom)
                }
            }
        }
    }
    
    func lineMarks() -> some ChartContent {
        return ForEach(salesAmount, id: \.id) { amount in
            if let category = amount.category, let legendTitle {
                LineMark(
                    x: .value(xAxisLabel, amount.date),
                    y: .value(yAxisLabel, amount.sales)
                )
                .foregroundStyle(by: .value(legendTitle, category))
            } else {
                LineMark(
                    x: .value(xAxisLabel, amount.date),
                    y: .value(yAxisLabel, amount.sales)
                )
            }
        }
    }
}

// MARK: -  Bar Chart
struct BarChart: View, ChartView {
    var salesAmount: [any SalesData]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var showAverage: Bool = false
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                if showAverage {
                    barMarks()
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    let average: Double = Double(salesAmount.reduce(0) { $0 + $1.sales }) / Double(salesAmount.count)
                    RuleMark(
                        y: .value("Average", average)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 3))
                } else {
                    barMarks()
                }
            }
        }
    }
    
    func barMarks() -> some ChartContent {
        return ForEach(salesAmount, id: \.id) { amount in
            if let category = amount.category, let legendTitle {
                BarMark(
                    x: .value(xAxisLabel, amount.date),
                    y: .value(yAxisLabel, amount.sales)
                )
                .foregroundStyle(by: .value(legendTitle, category))
            } else {
                BarMark(
                    x: .value(xAxisLabel, amount.date),
                    y: .value(yAxisLabel, amount.sales)
                )
            }
        }
    }
}

struct BarChartTranspose: View, ChartView {
    var salesAmount: [any SalesData]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var showAverage: Bool = false
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                if showAverage {
                    barMarks()
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    let average: Double = Double(salesAmount.reduce(0) { $0 + $1.sales }) / Double(salesAmount.count)
                    RuleMark(
                        x: .value("Average", average)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 3))
                } else {
                    barMarks()
                }
            }
            .chartLegend(.hidden)
        }
    }
    
    func barMarks() -> some ChartContent {
        return ForEach(salesAmount, id: \.id) { amount in
            if let category = amount.category, let legendTitle {
                BarMark(
                    x: .value(xAxisLabel, amount.sales),
                    y: .value(yAxisLabel, category)
                )
                .foregroundStyle(by: .value(legendTitle, category))
            } else {
                BarMark(
                    x: .value(xAxisLabel, amount.sales),
                    y: .value(yAxisLabel, amount.date)
                )
            }
        }
    }
}

// MARK: - Scatter Chart
struct ScatterChart: View, ChartView {
    var salesAmount: [any SalesData]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                ForEach(salesAmount, id: \.id) { amount in
                    if let category = amount.category, let legendTitle {
                        PointMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                        .foregroundStyle(by: .value(legendTitle, category))
                    } else {
                        PointMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                    }
                }
            }
        }
    }
}

// MARK: - Area Chart
struct AreaChart: View, ChartView {
    var salesAmount: [any SalesData]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                ForEach(salesAmount, id: \.id) { amount in
                    if let category = amount.category, let legendTitle {
                        AreaMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                        .foregroundStyle(by: .value(legendTitle, category))
                        .interpolationMethod(.catmullRom)
                    } else {
                        AreaMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                        .interpolationMethod(.catmullRom)
                    }
                }
            }
        }
    }
}

// MARK: - Heatmap
struct HeatMap: View, ChartView {
    var salesCount: [SalesCount]
    
    var chartTitle: String?
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var body: some View {
        VStack {
            if let chartTitle {
                HStack {
                    Text(chartTitle)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            
            Chart {
                ForEach(salesCount, id: \.id) { count in
                    if let category = count.category, let store = count.store, let legendTitle {
                        RectangleMark(
                            x: .value(xAxisLabel, category),
                            y: .value(yAxisLabel, store),
                            width: .ratio(1),
                            height: .ratio(1)
                        )
                        .foregroundStyle(by: .value(legendTitle, count.sales))
                    }
                } 
            }
            .chartLegend(.hidden)
            .chartYAxis {
                AxisMarks(preset: .aligned)
            }
            .chartXAxis {
                AxisMarks(position: .top)
            }
        }
    }
    
    
}
