//
//  PetImage.swift
//  PetChat
//
//  Created by James Rochabrun on 2/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct PetImage {
    
    let image: UIImage
    let name: String
    
    init(json: JSON) {
        self.image = UIImage()
        self.name = json["name"].stringValue
    }
}
