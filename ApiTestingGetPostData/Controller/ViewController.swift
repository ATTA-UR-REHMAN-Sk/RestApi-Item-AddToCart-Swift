//
//  ViewController.swift
//  ApiTestingGetPostData
//
//  Created by apple on 12/01/2023.
//
import SDWebImage
import UIKit
import Alamofire

class ViewController: UIViewController {
    var selectedImg: UIImage?
    var segmentValue = 0
    var chkCount = 0
    
    /////
    var addToCartImg = [UIImage]()
    var addLbl1 = [String]()
    var addLbl2 = [String]()
    
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var tblView: UITableView!
    
    var productDetails = productViewModel()
    // var imagesList = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        //        self.getJSONData()
        productDetails.getProductData()
        productDetails.vc = self
        tblView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool)
    {
        tblView.reloadData()
        
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentValue = 0
            break
        case 1:
           segmentValue = 1
            break
        case 2:
           segmentValue = 2
            break
        default:
            break
        }
        tblView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productDetails.productData.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        
        //let apiData = productDetails.productData[indexPath.row]
        
        switch segmentValue {
        case 0:
            //segmentValue = 0
            let apiData = productDetails.productData[indexPath.row]
            if ("\(apiData.id)" == "Optional(1)" || "\(apiData.id)" == "Optional(2)" || "\(apiData.id)" == "Optional(3)" || "\(apiData.id)" == "Optional(4)") {
                cell?.cellLbl2.isHidden = false
                cell?.cellImg.isHidden = false
                cell?.cellLbl3.isHidden = false
                // tblView.reloadData()
                cell?.cellLbl1.text = "\(apiData.id)"
                cell?.cellLbl2.text = "\(apiData.title)"
                cell?.cellLbl3.text = "\(apiData.description)"
                
                cell?.cellImg?.sd_setImage(with: URL(string: productDetails.productData[indexPath.row].image ?? ""), placeholderImage: #imageLiteral(resourceName: "bird.jpeg"), options: .handleCookies, completed: nil)
            }
            break
                
            
        case 1:
            let apiData = productDetails.productData[indexPath.row]
            if ("\(apiData.id)" == "Optional(5)" || "\(apiData.id)" == "Optional(6)" || "\(apiData.id)" == "Optional(7)" || "\(apiData.id)" == "Optional(8)") {
                
                chkCount = "\(apiData.id)".count
                //segmentValue = 1
                cell?.cellLbl2.isHidden = false
                cell?.cellLbl3.isHidden = false
                cell?.cellImg.isHidden = false
                //  tblView.reloadData()
                
                cell?.cellLbl1.text = "\(apiData.id)"
                cell?.cellLbl2.text = "\(apiData.title)"
                cell?.cellLbl3.text = "\(apiData.description)"
                
                cell?.cellImg?.sd_setImage(with: URL(string: productDetails.productData[indexPath.row].image ?? ""), placeholderImage: #imageLiteral(resourceName: "bird.jpeg"), options: .handleCookies, completed: nil)
            }
            break
            
        case 2:
           // segmentValue = 2
            let apiData = productDetails.productData[indexPath.row]
            if ("\(apiData.id)" == "Optional(9)" || "\(apiData.id)" == "Optional(10)" || "\(apiData.id)" == "Optional(11)" || "\(apiData.id)" == "Optional(12)" || "\(apiData.id)" == "Optional(13)" || "\(apiData.id)" == "Optional(14)") {
                cell?.cellLbl2.isHidden = false
                cell?.cellImg.isHidden = false
                cell?.cellLbl3.isHidden = false
                // tblView.reloadData()
                let apiData = productDetails.productData[indexPath.row]
                cell?.cellLbl1.text = "\(apiData.id)"
                cell?.cellLbl2.text = "\(apiData.title)"
                cell?.cellLbl3.text = "\(apiData.description)"
                
                cell?.cellImg?.sd_setImage(with: URL(string: productDetails.productData[indexPath.row].image ?? ""), placeholderImage: #imageLiteral(resourceName: "bird.jpeg"), options: .handleCookies, completed: nil)
            }
            break
            
        default:
            print("NO DATA Found")
            break
        }
        
        //cell?.cellImg.image = Utilities.getImageFromURL(name: apiData.image ?? "bird.jpeg")
//        cell?.cellLbl1.text = "\(apiData.id)"
//        cell?.cellLbl2.text = "\(apiData.title)"
//        cell?.cellLbl3.text = "\(apiData.description)"
//
//        cell?.cellImg?.sd_setImage(with: URL(string: productDetails.productData[indexPath.row].image ?? ""), placeholderImage: #imageLiteral(resourceName: "bird.jpeg"), options: .handleCookies, completed: nil)
        
        
       return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.reloadData()
        let data = productDetails.productData[indexPath.row]
        
        let imageURL = URL(string: data.image ?? "")
        SDWebImageManager.shared.loadImage(with: imageURL, options: .continueInBackground, progress: nil) { (image, data, error, cacheType, finished, url) in
            guard let image = image else { return }
            self.selectedImg = image
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController
    
        vc?.getImg = selectedImg
        vc?.Lbl1 = "\(data.id)"
        vc?.Lbl2 = data.title
        vc?.Lbl3 = data.description
        
        print(data.id,"    ",data.title)
        print("Image In Varaible :", data.image)
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

//extension ViewController {
//
//    func getJSONData() {
//        Alamofire.URL(string: "https://fakestoreapi.com/products/").res { (response) in
//            print(response)
//
//
//       // Alamofire.request(URL(string: "https://fakestoreapi.com/products/") ?? "").responseJSON {
////            (response) in
////            print(response)
////        }
//    }
//}
