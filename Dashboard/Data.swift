//
//  Data.swift
//  Dashboard
//


import Foundation
import SwiftUI

// MARK: Date Structure
// MARK: -
protocol SalesData: Identifiable {
    var sales: Int { get }
    var date: Date { get }
    var category: String? { get }
    var id: UUID { get }
}

// MARK: -
struct SalesAmount: SalesData {
    /// sales amount
    var sales: Int
    /// date
    var date: Date
    /// chart color
    var color: Color
    /// item category
    var category: String?
    /// identifier
    var id = UUID()
}

// MARK: -
struct SalesCount: SalesData {
    /// sales count
    var sales: Int
    /// date
    var date: Date
    /// chart color
    var color: Color
    /// item category
    var category: String?
    /// store
    var store: String?
    /// identifier
    var id = UUID()
}

// MARK: - Pancake topping
enum PancakeTopping: String {
    case chocolate = "Chocolate"
    case strawberry = "Strawberry"
    case blueberry = "Blueberry"
    case banana = "Banana"
}

// MARK: - Pancake store place
enum PancakeStore: String {
    case ginza = "Ginza"
    case marunouchi = "Marunouchi"
    case omotesando = "Omotesando"
    case shinjuku = "Shinjuku"
    case shibuya = "Shibuya"
}

// MARK: - Pancakes data
struct PancakesData {
    let totalSales: [SalesAmount]
    let salesPerCategory: [SalesAmount]
    let salesCategoryVsStore: [SalesCount]
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        // MARK: -  Total Sales
        let totalSalesChartColor = Color.blue
        totalSales = [
            SalesAmount(sales: 20000, date: dateFormatter.date(from: "2022/09/01")!, color: totalSalesChartColor),
            SalesAmount(sales: 18000, date: dateFormatter.date(from: "2022/09/02")!, color: totalSalesChartColor),
            SalesAmount(sales: 23000, date: dateFormatter.date(from: "2022/09/03")!, color: totalSalesChartColor),
            SalesAmount(sales: 15000, date: dateFormatter.date(from: "2022/09/04")!, color: totalSalesChartColor),
            SalesAmount(sales: 18000, date: dateFormatter.date(from: "2022/09/05")!, color: totalSalesChartColor),
            SalesAmount(sales: 12000, date: dateFormatter.date(from: "2022/09/06")!, color: totalSalesChartColor),
            SalesAmount(sales: 20000, date: dateFormatter.date(from: "2022/09/07")!, color: totalSalesChartColor),
            SalesAmount(sales: 22000, date: dateFormatter.date(from: "2022/09/08")!, color: totalSalesChartColor),
            SalesAmount(sales: 19000, date: dateFormatter.date(from: "2022/09/09")!, color: totalSalesChartColor),
        ]
        
        // MARK: - Sales per category
        salesPerCategory = [
            SalesAmount(sales: 5000, date: dateFormatter.date(from: "2022/09/01")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/01")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/01")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/01")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 7000, date: dateFormatter.date(from: "2022/09/02")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/02")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 5000, date: dateFormatter.date(from: "2022/09/02")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/02")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/03")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 8000, date: dateFormatter.date(from: "2022/09/03")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/03")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 7000, date: dateFormatter.date(from: "2022/09/03")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/04")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/04")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/04")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/04")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 7000, date: dateFormatter.date(from: "2022/09/05")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/05")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/05")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/05")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/06")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/06")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/06")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 5000, date: dateFormatter.date(from: "2022/09/06")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 7000, date: dateFormatter.date(from: "2022/09/07")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/07")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/07")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/07")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 3000, date: dateFormatter.date(from: "2022/09/08")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 6000, date: dateFormatter.date(from: "2022/09/08")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/08")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 7000, date: dateFormatter.date(from: "2022/09/08")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
            
            SalesAmount(sales: 2000, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                        category: PancakeTopping.chocolate.rawValue),
            SalesAmount(sales: 8000, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                        category: PancakeTopping.strawberry.rawValue),
            SalesAmount(sales: 4000, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                        category: PancakeTopping.blueberry.rawValue),
            SalesAmount(sales: 5000, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                        category: PancakeTopping.banana.rawValue),
        ]
        
        // MARK: Sales counts, Category vs Store
        salesCategoryVsStore = [
            SalesCount(sales: 100, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                       category: PancakeTopping.chocolate.rawValue, store: PancakeStore.ginza.rawValue),
            SalesCount(sales: 120, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                       category: PancakeTopping.strawberry.rawValue, store: PancakeStore.ginza.rawValue),
            SalesCount(sales: 90, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                       category: PancakeTopping.blueberry.rawValue, store: PancakeStore.ginza.rawValue),
            SalesCount(sales: 110, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                       category: PancakeTopping.banana.rawValue, store: PancakeStore.ginza.rawValue),
            
            SalesCount(sales: 80, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                       category: PancakeTopping.chocolate.rawValue, store: PancakeStore.marunouchi.rawValue),
            SalesCount(sales: 100, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                       category: PancakeTopping.strawberry.rawValue, store: PancakeStore.marunouchi.rawValue),
            SalesCount(sales: 130, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                       category: PancakeTopping.blueberry.rawValue, store: PancakeStore.marunouchi.rawValue),
            SalesCount(sales: 120, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                       category: PancakeTopping.banana.rawValue, store: PancakeStore.marunouchi.rawValue),
            
            SalesCount(sales: 110, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                       category: PancakeTopping.chocolate.rawValue, store: PancakeStore.omotesando.rawValue),
            SalesCount(sales: 80, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                       category: PancakeTopping.strawberry.rawValue, store: PancakeStore.omotesando.rawValue),
            SalesCount(sales: 90, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                       category: PancakeTopping.blueberry.rawValue, store: PancakeStore.omotesando.rawValue),
            SalesCount(sales: 120, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                       category: PancakeTopping.banana.rawValue, store: PancakeStore.omotesando.rawValue),
            
            SalesCount(sales: 120, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                       category: PancakeTopping.chocolate.rawValue, store: PancakeStore.shinjuku.rawValue),
            SalesCount(sales: 110, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                       category: PancakeTopping.strawberry.rawValue, store: PancakeStore.shinjuku.rawValue),
            SalesCount(sales: 80, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                       category: PancakeTopping.blueberry.rawValue, store: PancakeStore.shinjuku.rawValue),
            SalesCount(sales: 90, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                       category: PancakeTopping.banana.rawValue, store: PancakeStore.shinjuku.rawValue),
            
            SalesCount(sales: 100, date: dateFormatter.date(from: "2022/09/09")!, color: .blue,
                       category: PancakeTopping.chocolate.rawValue, store: PancakeStore.shibuya.rawValue),
            SalesCount(sales: 90, date: dateFormatter.date(from: "2022/09/09")!, color: .green,
                       category: PancakeTopping.strawberry.rawValue, store: PancakeStore.shibuya.rawValue),
            SalesCount(sales: 120, date: dateFormatter.date(from: "2022/09/09")!, color: .orange,
                       category: PancakeTopping.blueberry.rawValue, store: PancakeStore.shibuya.rawValue),
            SalesCount(sales: 70, date: dateFormatter.date(from: "2022/09/09")!, color: .yellow,
                       category: PancakeTopping.banana.rawValue, store: PancakeStore.shibuya.rawValue),
            
        ]
    }
}
