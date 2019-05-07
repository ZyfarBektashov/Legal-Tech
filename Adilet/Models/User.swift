//
//  SignUp.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import Foundation

struct User: Decodable {
    var first_name: String
    var last_name: String
    var date_of_birth: String
    var gender: String
    var email: String
    var passport_no: String
    var passport_expiration: String
    var password: String
    
    func toDictionary() -> [String: Any] {
        return ["first_name" : first_name,
                "last_name" : last_name,
                "date_of_birth": date_of_birth,
                "gender": gender,
                "email": email,
                "passport_no": passport_no,
                "passport_expiration": passport_expiration,
                "password": password]
    }
}

struct Create: Decodable {
    var username: String
    var password: String
    
    func toDictionary() -> [String: Any] {
        return ["username" : username,
                "password" : password]
    }
}

struct Token: Decodable {
    var token: String
}
