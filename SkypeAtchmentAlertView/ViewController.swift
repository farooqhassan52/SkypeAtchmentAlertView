//
//  ViewController.swift
//  SkypeAtchmentAlertView
//
//  Created by Farooq Hassan on 3/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func showAlertTap(_ sender: Any) {
        
        let newAlertController = CustomAlertVC()
        
        let PhotoButton1 = CustomAlertAction(name: "Photos", image: UIImage(named: "sendpicicon"), decs: "Share photos") {
            print("Photos button tapped")
              
        }
        
        let fileButton1 = CustomAlertAction(name: "Files", image: UIImage(named: "sendFile"), decs: "Share files") {
            print("File button tapped")
            
        }
        
        let sendTokenButton1 = CustomAlertAction(name: "Send Token", image: UIImage(named: "wizzNewIcon"), decs: "Share tokens") {
            print("SendToken button tapped")
            
        }
        
        newAlertController.addAction(name: PhotoButton1)
        newAlertController.addAction(name:fileButton1)
        newAlertController.addAction(name: sendTokenButton1)
        
        self.present(newAlertController, animated: true, completion: nil)
    }
    
    
}

