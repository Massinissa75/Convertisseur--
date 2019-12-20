//
//  Services.swift
//  Convertisseur
//
//  Created by Massinissa.R on 09/12/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import Foundation

/*struct Services: Decodable {

    enum CodingKeys: String, CodingKey {
        case rates = "rates"
        case dates = "date"
    }
    var rates: [String : Float]
    private var dates: String

    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-M-d"

        guard let dateFormatted = dateFormatter.date(from: dates) else {
            fatalError()
        }
        return dateFormatted
    }
}*/

/*struct Rates: Decodable {
  //var money = ""
  var usd: Double?
}
struct DollarRate {
    static var rate: Double?
    static var error: String?
}*/

//   let services = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
struct Services: Decodable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: Rates?
}

struct Rates: Decodable {
    let USD: Double?
}

struct DollarRate {
    static var rate: Double?
    static var error: String?
}


