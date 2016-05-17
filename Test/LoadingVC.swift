//
//  LoadingVC.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/15/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit
import JHSpinner

class LoadingVC: UIViewController {
    var spinner:JHSpinnerView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
         spinner = JHSpinnerView.showOnView(view, spinnerColor:UIColor.redColor(), overlay:.FullScreen, overlayColor:UIColor.whiteColor().colorWithAlphaComponent(0.8))
        view.addSubview(spinner)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        spinner.dismiss()
    }
}
