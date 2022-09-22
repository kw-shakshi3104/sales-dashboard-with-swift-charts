//
//  Charts.swift
//  Dashboard
//


import Foundation
import SwiftUI
import Charts

struct LineChart: View {
    var salesAmount: [SalesAmount]
    
    var body: some View {
        Chart {
            ForEach(salesAmount) { amount in
                LineMark(
                    x: .value("Date", amount.date),
                    y: .value("Sales", amount.sales)
                )
            }
        }
    }
}

struct BarChart: View {
    var salesAmount: [SalesAmount]
    
    var body: some View {
        Chart {
            ForEach(salesAmount) { amount in
                BarMark(
                    x: .value("Date", amount.date),
                    y: .value("Sales", amount.sales)
                )
            }
        }
    }
}
