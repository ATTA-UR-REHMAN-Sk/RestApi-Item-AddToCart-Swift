//
//  CartViewController.swift
//  ApiTestingGetPostData
//
//  Created by apple on 16/01/2023.
//

import UIKit

//var productImg: UIImage?
//protocol cartValue {
//    func myCartVal(cartVal: Int)
//}

var productId: [String]?
var productTile: [String]?

var cartImagesArr : [UIImage]?

class CartViewController: UIViewController {
    
  
  //  var delegate: cartValue? = nil
    
    
    @IBOutlet weak var cartTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productId = addLbl1
        productTile = addLbl2
        cartImagesArr = addToCartImg
        
        
        cartTblView.reloadData()
        
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total Images In Arr Are : " ,cartImagesArr?.count)
        //self.delegate?.myCartVal(cartVal: cartImagesArr?.count ?? 1)
        return cartImagesArr?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        
        
        print("Total Images In Arr Are : " ,cartImagesArr)
        cell.cartImage.image = cartImagesArr![indexPath.row]
        cell.cartLbl1.text = productId![indexPath.row]
        cell.cartLbl2.text =  productTile![indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            cartImagesArr?.remove(at: indexPath.row)
            productId?.remove(at: indexPath.row)
            productTile?.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
            
    }
    
}
