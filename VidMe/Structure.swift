//
//  Structure.swift
//  VidMe
//
//  Created by LIV on 15.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import Foundation

struct VideoCellAttribute {
    
    let id: String
    let title: String
    let thumbnailUrl: String
    let videoUrl: String
    
    init(id: String, title: String,thumbnailUrl: String, videoUrl: String) {
        
        self.id = id
        self.title = title
        self.thumbnailUrl = thumbnailUrl
        self.videoUrl = videoUrl
        print("init: \(id)_\(title)_\(thumbnailUrl)_\(videoUrl)")
    }
}
