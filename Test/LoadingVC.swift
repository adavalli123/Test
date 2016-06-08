//
//  LoadingVC.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/15/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit
import JHSpinner
import CBGPromise

class LoadingVC: UIViewController {
    var spinner:JHSpinnerView!
    var mainThreadExecuter: MainThreadExecuter!
    
    var product:Product!
    
    var shoppingService: ShoppingItemService!
    var readyToGoFuture: Future<FutureResult>!
    
    override func viewDidLoad() {
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        spinner = JHSpinnerView.showOnView(view, spinnerColor:UIColor.redColor(), overlay:.FullScreen, overlayColor:UIColor.whiteColor().colorWithAlphaComponent(0.8))
        view.addSubview(spinner)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        shoppingService.updateList().then { result in
            guard let future = self.readyToGoFuture else { return }
            
            if future.value == nil {
                self.waitForMenuPromise(future)
                self.performSegueWithIdentifier("showMain", sender: future)
                self.viewWillDisappear(false)
            } else {
                self.handleResult(future.value as FutureResult!)
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        spinner.dismiss()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMain"
        {
            guard let mainVC = segue.destinationViewController as? MainVC
                else { return }
            guard let nxt  = sender as? Product else {
                return print(NSError)
            }
            viewWillDisappear(false)
            mainVC.product = nxt
            
        }
        
    }
    
    private func waitForMenuPromise(menuFuture: Future<FutureResult>) {
        self.mainThreadExecuter.startSpinner(self)
        menuFuture.then { result in
            self.mainThreadExecuter.execute {
                self.handleResult(result)
                self.mainThreadExecuter.stopSpinner(self)
            }
        }
    }
    
    private func handleResult(result: FutureResult) {
        switch result {
        case .success: break
        case .failure:
            let alertView = UIAlertController(title: nil, message: "Error connecting to menu.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "CANCEL", style: .Default) { _ in
                self.navigationController?.performSegueWithIdentifier("showWelcome", sender: nil)
                })
            alertView.addAction(UIAlertAction(title: "RETRY", style: .Default) { _ in
//                self.waitForMenuPromise(self.menuBroker.getMenuAndStore())
                })
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        
        self.readyToGoFuture = nil
    }

    
}
