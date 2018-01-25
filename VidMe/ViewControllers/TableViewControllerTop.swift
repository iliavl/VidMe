//
//  TableViewControllerTop.swift
//  VidMe
//
//  Created by LIV on 06.10.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit

class TableViewControllerTop: VideoListView {

    override func loadFromJsonInTable(urlString: String) {
        
        let urlString = "https://api.vid.me/channel/11/new"
        
        super.loadFromJsonInTable(urlString: urlString)
    }

}
