//
//  Data.swift
//  Dashboard
//


import Foundation
import SwiftUI

struct SalesAmount: Identifiable {
    var sales: Int
    var date: Date
    var color: Color
    var id = UUID()
}

func getSalesAmount(color: Color = .blue) -> [SalesAmount] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    
    return [
        SalesAmount(sales: 20000, date: dateFormatter.date(from: "2022/09/01")!, color: color),
        SalesAmount(sales: 17000, date: dateFormatter.date(from: "2022/09/02")!, color: color),
        SalesAmount(sales: 30000, date: dateFormatter.date(from: "2022/09/03")!, color: color),
        SalesAmount(sales: 15000, date: dateFormatter.date(from: "2022/09/04")!, color: color),
        SalesAmount(sales: 23000, date: dateFormatter.date(from: "2022/09/05")!, color: color),
        SalesAmount(sales: 18000, date: dateFormatter.date(from: "2022/09/06")!, color: color),
        SalesAmount(sales: 21000, date: dateFormatter.date(from: "2022/09/07")!, color: color),
        SalesAmount(sales: 22000, date: dateFormatter.date(from: "2022/09/08")!, color: color),
        SalesAmount(sales: 28000, date: dateFormatter.date(from: "2022/09/09")!, color: color),
    ]
}
