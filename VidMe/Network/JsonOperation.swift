//
//  JsonOperation.swift
//  VidMe
//
//  Created by LIV on 15.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit

class JsonOperation: NSObject {
    
    //var dataForTable = [VideoCellAttribute]()
    
    static let sharedInstance = JsonOperation()
    
    
    func loadDataJsonNewVideo(urlString: String, completion: @escaping (_ dataForTable: [VideoCellAttribute]) -> Void) {
        
        var dataForTable = [VideoCellAttribute]()
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print("request is done")
                
                if let jsonData = data {
                    do {
                        
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
                            
                            if let videosArray = json["videos"] as? [[String: Any]] {
                                
                                for video in videosArray {
                                    
                                    let id = video["video_id"] as! String
                                    
                                    var title = "empty"
                                    
                                    if let titleChecked = video["title"] as? String {
                                        
                                        title = titleChecked
                                    }
                                    
                                    let thumbnailUrl = video["thumbnail_url"] as! String
                                    
                                    let formatsDict = video["formats"] as? [[String: Any]]
                                    
                                    var videoUrl = ""
                                    
                                    if let videoFormatsUrl = formatsDict?[0] {
                                        
                                        videoUrl = videoFormatsUrl["uri"] as! String
                                    }
                                    
                                    dataForTable.append(VideoCellAttribute.init(id: id, title: title, thumbnailUrl: thumbnailUrl, videoUrl: videoUrl))
                                }
                                
                                completion(dataForTable)
                            }
                        }
                            
                        else {
                            print("error data")
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("data is nil")
                }
            }
            
            task.resume()
            print("request is started")
        }
    }
    
}
