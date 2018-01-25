//
//  TableViewControllerFollow.swift
//  VidMe
//
//  Created by LIV on 20.09.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit

class TableViewControllerFollow: VideoListView {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let myFirstButton = UIButton()
        myFirstButton.setTitle("***", for: .normal)
        myFirstButton.setTitleColor(UIColor.blue, for: .normal)
        myFirstButton.frame = CGRect(x: 300, y: 25, width: 50, height: 50)
        myFirstButton.backgroundColor = UIColor.white
        myFirstButton.setImage(UIImage(named: "logout-513.png"), for: .normal)
        myFirstButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        self.view.addSubview(myFirstButton)
        
        let access = Constants.shared.access
            if !access {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! RegisterViewController
                self.present(vc, animated: false, completion: nil)
            }
    }
    
    func logout(sender: UIButton!) {
        
        HttpOperation.sharedInstance.logout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! RegisterViewController
        self.present(vc, animated: false, completion: nil)
        
//        var alertView = UIAlertView();
//        alertView.addButton(withTitle: "Ok");
//        alertView.title = "title";
//        alertView.message = "message";
//        alertView.show();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func loadFromJsonInTable(urlString: String) {
        
        let urlString = "https://api.vid.me/videos/feed"
        
        super.loadFromJsonInTable(urlString: urlString)
    }
}
