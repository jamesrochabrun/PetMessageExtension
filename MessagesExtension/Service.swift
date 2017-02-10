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
    
    let tron = TRON(baseURL: "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?")
    
    static let sharedInstance = Service()
    
    func fetchGridFeed(completion: @escaping (GridDataSource) -> ()) {
        
        let request: APIRequest<GridDataSource, JSONError> = tron.request("/random/kitten")
        
        request.headers = ["tags": "animal", "format" : "json"]
        
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
