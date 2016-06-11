//
//  MainVC.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/15/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let titleLabel = UILabel()
        let colour = UIColor.redColor()
        let attributes: [String : AnyObject] = [NSFontAttributeName: UIFont.boldSystemFontOfSize(28.0), NSForegroundColorAttributeName: colour, NSKernAttributeName : 5.0]
        titleLabel.attributedText = NSAttributedString(string: "HOME", attributes: attributes)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellIdentifier",forIndexPath: indexPath) as? ProductTableViewCell

        cell!.configure(product.items[indexPath.row])
        return cell!
    }
}
