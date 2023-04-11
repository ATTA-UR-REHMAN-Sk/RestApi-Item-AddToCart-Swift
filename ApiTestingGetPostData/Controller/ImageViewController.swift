//
//  ImageViewController.swift
//  ApiTestingGetPostData
//
//  Created by apple on 13/01/2023.
//

import UIKit
var addToCartImg = [UIImage]()
var addLbl1 = [String]()
var addLbl2 = [String]()

class ImageViewController: UIViewController {

    var getImg: UIImage?
    var Lbl1: String?
    var Lbl2: String?
    var Lbl3: String?
    
//    var addToCartImg = [UIImage]()
//    var addLbl1 = [String]()
//    var addLbl2 = [String]()
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var cartValueLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgView.image = getImg
        print("Image In Image Variable : ",getImg)
        lbl1.text = Lbl1
        lbl2.text = Lbl2
        lbl3.text = Lbl3
        
        cartValueLbl.text = String(Int(cartImagesArr?.count ?? 0))
        print(cartImagesArr?.count)
    }
    
//    func myCartVal(cartVal: Int) {
//        cartValueLbl.text = "\(myCartVal(cartVal: cartVal))"
//        print("\(myCartVal(cartVal: cartVal))")
//    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        
       // let VC = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        //VC.productImg = getImg
//        VC.productId = Lbl1
//        VC.productTile = Lbl2
        
        addToCartImg.append(getImg!)
        addLbl1.append(Lbl1!)
        addLbl2.append(Lbl2!)
        cartValueLbl.text = String(Int(cartImagesArr?.count ?? 0))
        print(cartImagesArr?.count)
    }
    

    @IBAction func btnShowCart(_ sender: UIButton) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//        VC.cartImagesArr = addToCartImg
//        VC.productId = addLbl1
//        VC.productTile = addLbl2
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}
