//
//  Charts.swift
//  Dashboard
//


import Foundation
import SwiftUI
import Charts

struct LineChart: View {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                    if let category = amount.category {
                        LineMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                        .foregroundStyle(by: .value("Topping", category))
                    } else {
                        LineMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                    }
                }
            }
        }
    }
}

struct BarChart: View {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                    if let category = amount.category {
                        BarMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                        .foregroundStyle(by: .value("Topping", category))
                    } else {
                        BarMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                    }
                }
            }
        }
    }
}

struct ScatterChart: View {
    var chartTitle: String? = nil
    var salesAmount: [SalesAmount]
    
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
                    if let category = amount.category {
                        PointMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                        .foregroundStyle(by: .value("Topping", category))
                    } else {
                        PointMark(
                            x: .value("Date", amount.date),
                            y: .value("Sales", amount.sales)
                        )
                    }
                }
            }
        }
    }
}
