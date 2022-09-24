//
//  ContentView.swift
//  Dashboard
//


import SwiftUI
import Charts

struct ContentView: View {
    private var pancakesData = PancakesData()
    
    var body: some View {
        SalesSummaryView(pancakesData: pancakesData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
