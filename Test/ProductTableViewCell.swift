//
//  ProductTableViewCell.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/15/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var prodColor: UILabel!
    @IBOutlet weak var prodPrice: UILabel!
    
    func configure(items: Items) {
       self.productImage.image = items.productImage
        self.prodName.text = items.productName
        self.prodColor.text = items.prodColor
        self.prodPrice.text = "$\(items.productPrice)"
    }
}
