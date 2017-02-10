//
//  DataSource.swift
//  PetChat
//
//  Created by James Rochabrun on 2/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

class GridDataSource: JSONDecodable {
    
    let images: [PetImage]
    
    required init(json: JSON) throws {
        
        print("jsonnnn: ", json)
        let imagesArray = json["items"].array
        self.images = imagesArray as? [PetImage]
    }
    
}

