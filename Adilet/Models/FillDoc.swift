//
//  FillDoc.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import Foundation

struct FillDoc: Decodable {
    var first_side: String
    var place: String
    var first_name: String
    var last_name: String
    var second_side: String
    var second_first_name: String
    var second_last_name: String
    var day: String
    var month: String
    var year: String
    var duration: String
    
    func toDictionary() -> [String: Any] {
        return ["first_side" : first_side,
                "place" : place,
                "first_name": first_name,
                "last_name": last_name,
                "second_side": second_side,
                "second_first_name": second_first_name,
                "second_last_name": second_last_name,
                "day": day,
                "month": month,
                "year": year,
                "duration": duration]
    }
}
