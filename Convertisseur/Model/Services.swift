//
//  Services.swift
//  Convertisseur
//
//  Created by Massinissa.R on 09/12/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import Foundation

struct Services: Decodable {

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
}
