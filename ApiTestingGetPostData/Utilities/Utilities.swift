//
//  Utilities.swift
//  ApiTestingGetPostData
//
//  Created by apple on 13/01/2023.
//

import Foundation
import SDWebImage
import UIKit

class Utilities {
    public static func getImageFromURL(name:String)->UIImage?{
        
        let _url = URL(string: "https://fakestoreapi.com/img/\(name)")
        guard let url = _url else {
            return nil
        }
       // self.productData.append(contentsOf: responseModel)
        
        let _data = try? Data(contentsOf: url)
        guard let data = _data else {
            return nil
        }
        let image = UIImage(data: data)
        return image
    }
}
