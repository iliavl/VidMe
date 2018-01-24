//
//  videosRealm.swift
//  VidMe
//
//  Created by LIV on 21.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import Foundation
import RealmSwift

class videosRealm: Object {
    
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var thumbnailUrl: String = ""
    dynamic var videoUrl: String = ""
    
    convenience init(id: String, title: String, thumbnailUrl: String, videoUrl: String) {
        
        self.init()
        self.id = id
        self.title = title
        self.thumbnailUrl = thumbnailUrl
        self.videoUrl = videoUrl
    }
}
