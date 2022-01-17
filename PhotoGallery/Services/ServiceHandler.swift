//
//  ServiceHandler.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 12/01/2022.
//

import Foundation
import Alamofire
import SwiftyJSON



class ServicesHandler: NSObject {
    
    static let shared: ServicesHandler = ServicesHandler()
    typealias completionHandler = ([PhotoDataModel]?, Bool) -> Void
    
    //Function Provides Photos list
    func getPhotosList(completion: @escaping completionHandler){
        let url = URL(string: Constants.base_url+Constants.get_photos_url)
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).response(completionHandler: { response in

            switch response.result {
            case .success:
                var photoArray = [PhotoDataModel]()
                let json = JSON(response.data!)
                json["hits"].arrayValue.forEach { hit in
                    photoArray.append(PhotoDataModel.init(hit))
                }
                completion(photoArray,true)
            case .failure:
                completion(nil, false)
            }
        })
    }
}
