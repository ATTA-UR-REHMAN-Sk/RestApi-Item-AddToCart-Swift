//
//  productViewController.swift
//  ApiTestingGetPostData
//
//  Created by apple on 12/01/2023.
//

import Foundation

class productViewModel {
    
    var productData = [ProductData]()
    weak var vc: ViewController?
    
    func getProductData() {
        //let url = URL(string: "http://fackstoreapi.com/products/")
        URLSession.shared.dataTask(with: URL(string: "https://fakestoreapi.com/products/")!) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do{
                        
                        //let urlresponse =
                        let responseModel = try JSONDecoder().decode([ProductData].self, from: data)
                        print(responseModel)
                        self.productData.append(contentsOf: responseModel)
                        
                        
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                        print(self.productData)
                        
                    }catch let err {
                        print(err.localizedDescription)
                        
                    }
                }else{
                    print(error?.localizedDescription)
                }
            }
        }.resume()
    }

}
