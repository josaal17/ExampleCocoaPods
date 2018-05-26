//
//  ViewController.swift
//  ExampleCocoaPods
//
//  Created by MacBookDesarrolloTecno on 26/5/18.
//  Copyright © 2018 Technical PC. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet weak var dataView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SVProgressHUD.show()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RequestButton(_ sender: Any) {
        APIManager.getPostsEndpoint = "/posts/"
        APIManager.sharedInstance.getPostWithId(postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                self.dataView?.text = String(describing: json)
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    
}

