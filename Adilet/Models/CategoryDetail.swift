//
//  CategoryDetail.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import Foundation

struct CategoryDetail: Decodable {
    var id: Int
    var document_templates: [DocTemplate]
    var name: String
}

struct DocTemplate: Decodable {
    var id: Int
    var name: String
    var category: Int
}
