//
//  SummaryNavigationView.swift
//  Dashboard
//

import SwiftUI
import Charts

struct SummaryNavigationView: View {
    var pancakesData = PancakesData()
    private let indices: [String] = ["Sales"]
    @State private var selectedIndex: String?
    
    var body: some View {
        NavigationSplitView {
            List(indices, id: \.self, selection: $selectedIndex) { index in
                VStack(alignment: .leading) {
                    Text("Total \(index) in Past a Week")
                    
                    let totalSales = pancakesData.dailySales.reduce(0) { $0 + $1.sales }
                    Text("\(totalSales) pancakes")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Chart(pancakesData.dailySales) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Sales", $0.sales)
                        )
                        .interpolationMethod(.catmullRom)
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(height: 80)
                    .padding()
                }
                
            }
        } detail: {
            if selectedIndex != nil {
                SalesSummaryView(pancakesData: pancakesData)
            }
        }
    }
}

struct SummaryNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryNavigationView()
    }
}
