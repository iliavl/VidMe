//
//  RegisterViewController.swift
//  VidMe
//
//  Created by LIV on 07.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var textViewUserName: UITextField!
    @IBOutlet weak var textViewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        let username = textViewUserName.text!
        let password = textViewPassword.text!
        Constants.shared.access = false
        Constants.shared.username = username
        Constants.shared.password = password
        print("Try login")
        
        HttpOperation.sharedInstance.Login { (access) in
            
            if access {
                // show list
                UserDefaults.standard.setValue(username, forKey: "username")
                UserDefaults.standard.setValue(password, forKey: "password")
                UserDefaults.standard.setValue(access, forKey: "access")
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc: UITabBarController = mainStoryboard.instantiateViewController(withIdentifier: "Initial") as! UITabBarController
                vc.selectedIndex = 2
                self.present(vc, animated: true, completion: nil)
                
            } else {
                
                let alertController = UIAlertController(title: "Access", message: "Decline", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (action) in
                    print("Access error")
                })
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    @IBOutlet weak var buttonBackToFirst: UIButton!
    @IBAction func aButtonBackToFirst(_ sender: UIButton) {
        
        performSegue(withIdentifier: "Initial", sender: self)
    }
}
