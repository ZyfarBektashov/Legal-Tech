//
//  ServerManager.swift
//  JB
//
//  Created by ZYFAR on 21.01.2019.
//  Copyright © 2019 neobis. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    
    func getCategories(_ completion: @escaping ([MainCategory])-> Void, error: @escaping (String)-> Void) {
        self.get(api: "v1/document_categories/", completion: { (data) in
            do {
                guard let data = data else { return }
                let categories = try JSONDecoder().decode([MainCategory].self, from: data)
                completion(categories)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
    
    func getCategoryDetails(id: Int, _ completion: @escaping (CategoryDetail)-> Void, error: @escaping (String)-> Void) {
        self.get(api: "v1/document_categories/\(id)", completion: { (data) in
            do {
                guard let data = data else { return }
                let detail = try JSONDecoder().decode(CategoryDetail.self, from: data)
                completion(detail)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
    
    func signUp(user: User, _ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "v1/users", parameters: user.toDictionary(), completion: { (data) in
            completion()
        }, error: error)
    }
    
    func generatePDF(file: FillDoc, _ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: "v1/documents/generate", parameters: file.toDictionary(), completion: { (data) in
            completion()
        }, error: error)
    }
}
