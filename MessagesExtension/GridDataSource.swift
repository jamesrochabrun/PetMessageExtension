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
        
        let imagesArray = json["users"].array
        self.images = imagesArray!.map({PetImage(json: $0)})
    }
    
}

extension GridVC : UICollectionViewDataSource {
    
    
    
    //MARK: COLLECTIONVIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.6392156863, blue: 0.7843137255, alpha: 1)
        cell.imageView.image = UIImage.init(named: "puppy")
        return cell
    }
}
