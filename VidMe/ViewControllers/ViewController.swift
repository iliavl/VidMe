//
//  ViewController.swift
//  VidMe
//
//  Created by LIV on 01.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }

    // !!! Tung: такие классы лучше удалять. или переименовать в название понятное)) 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TabBarSegue" {
            
            //let destinationVC = segue.destination as! UITabBarViewController
            //destinationVC.delegate = self
        }
//        else if segue.identifier == "ShowInDetail" {
//            
//            delegate?.detailWeather(parameters: delegateParameters)
//        }
    }
    
    
    
    

}

