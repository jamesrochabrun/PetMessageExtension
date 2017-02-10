//
//  Service.swift
//  PetChat
//
//  Created by James Rochabrun on 2/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (GridDataSource) -> ()) {
        
        let request: APIRequest<GridDataSource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (gridDataSource) in
            completion(gridDataSource)
            
        }) { (err) in
            print("FAILED TRON REQUEST HOME FEED: ", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

    
    
}
