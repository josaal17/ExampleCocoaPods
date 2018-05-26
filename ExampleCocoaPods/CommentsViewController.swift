//
//  CommentsViewController.swift
//  ExampleCocoaPods
//
//  Created by MacBookDesarrolloTecno on 26/5/18.
//  Copyright © 2018 Technical PC. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    
    @IBOutlet weak var dataView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestComments(_ sender: Any) {
        APIManager.getPostsEndpoint = "/comments/"
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
