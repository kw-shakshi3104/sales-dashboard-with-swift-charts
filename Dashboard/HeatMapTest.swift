//
//  HeatMap.swift
//  Dashboard
//

import SwiftUI
import Charts

struct MatrixEntry: Identifiable {
    var positive: String
    var negative: String
    var num: Double
    var id = UUID()
}

struct HeatMapTest: View {
    var data: [MatrixEntry] = [
        MatrixEntry(positive: "+", negative: "+", num: 125),
        MatrixEntry(positive: "+", negative: "-", num: 10),
        MatrixEntry(positive: "-", negative: "-", num: 80),
        MatrixEntry(positive: "-", negative: "+", num: 1)
    ]

    
    var body: some View {
        VStack {
            Chart(data) {
                RectangleMark(
                    x: .value("Positive", $0.positive),
                    y: .value("Negative", $0.negative),
                    width: .ratio(1),
                    height: .ratio(1)
                )
                .foregroundStyle(by: .value("Number", $0.num))
            }
            .chartLegend(.hidden)
            .chartYAxis {
                AxisMarks(preset: .aligned)
            }
//            .chartYAxis(.hidden)
            .padding()
        }
    }
}

struct HeatMap_Previews: PreviewProvider {
    static var previews: some View {
        HeatMapTest()
    }
}
