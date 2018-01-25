//
//  TableViewControllerNew.swift
//  VidMe
//
//  Created by LIV on 16.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit

class TableViewControllerNew: VideoListView {

    override func viewWillAppear(_ animated: Bool) {
        
    }    
    
    override func loadFromJsonInTable(urlString: String) {
        
        let urlString = "https://api.vid.me/channel/10/new"
        
        super.loadFromJsonInTable(urlString: urlString)
    }
}
