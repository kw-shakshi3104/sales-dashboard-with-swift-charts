//
//  Charts.swift
//  Dashboard
//


import Foundation
import SwiftUI
import Charts

// MARK: - Chart Protocol
protocol ChartView {
    var chartTitle: String? { get }
    var salesAmount: [SalesAmount] { get }
    var xAxisLabel: String { get }
    var yAxisLabel: String { get }
    var legendTitle: String? { get }
}

// MARK: - Line Chart
struct LineChart: View, ChartView {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
    var xAxisLabel: String
    var yAxisLabel: String
    var legendTitle: String?
    
    var isShowAverage: Bool = false
    
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
                if isShowAverage {
                    lineMarks()
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    let average: Double = Double(salesAmount.reduce(0) { $0 + $1.sales }) / Double(salesAmount.count)
                    RuleMark(
                        y: .value("Average", average)
                    )
                } else {
                    lineMarks()
                }
            }
        }
    }
    
    func lineMarks() -> some ChartContent {
        return ForEach(salesAmount) { amount in
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

// MARK: -  Bar Chary
struct BarChart: View, ChartView {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                ForEach(salesAmount) { amount in
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
    }
}

// MARK: - Scatter Chart
struct ScatterChart: View, ChartView {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                ForEach(salesAmount) { amount in
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
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                ForEach(salesAmount) { amount in
                    if let category = amount.category, let legendTitle {
                        AreaMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                        .foregroundStyle(by: .value(legendTitle, category))
                    } else {
                        AreaMark(
                            x: .value(xAxisLabel, amount.date),
                            y: .value(yAxisLabel, amount.sales)
                        )
                    }
                }
            }
        }
    }
}
