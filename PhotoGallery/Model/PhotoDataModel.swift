//
//  PhotoDataModel.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 12/01/2022.
//

import Foundation
import SwiftyJSON

class PhotoDataModel:NSObject{
    var previewURL:String
    var largeImageURL:String

    
    init(_ obj:JSON) {//Initializer used the passed json object to parse the data and initializes the PhotoDataModel Object
        
        self.previewURL = obj["previewURL"].stringValue
        self.largeImageURL = obj["largeImageURL"].stringValue
    }
}
