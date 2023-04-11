//
//  TableViewCell.swift
//  ApiTestingGetPostData
//
//  Created by apple on 12/01/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cellImg: UIImageView!
    
    @IBOutlet weak var cellLbl1: UILabel!
    
    
    @IBOutlet weak var cellLbl2: UILabel!
    
    @IBOutlet weak var cellLbl3: UILabel!
    
    /////////////////////////Cart Details////////////////////////////////
    
    @IBOutlet weak var cartImage: UIImageView!
    
    @IBOutlet weak var cartLbl1: UILabel!
    
    @IBOutlet weak var cartLbl2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
