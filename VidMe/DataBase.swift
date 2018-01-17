//
//  DataBase.swift
//  VidMe
//
//  Created by LIV on 21.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit
import RealmSwift

class DataBase: NSObject {

    func realmAddToDBFav(id: String, name: String, thumbnailUrl: String, videoUrl: String) {
        
        do {
            let realm = try Realm()
            
            try realm.write {

                let videos = videosRealm(id: id, title: name,thumbnailUrl: thumbnailUrl, videoUrl: videoUrl)
                realm.add(videos)
            }
            
        } catch let error {
            print(error)
        }
        // path to DB
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    private func realmLoadFromDBFav() {
        
        //        do {
        //            let realm = try Realm()
        //            let cities = realm.objects(City.self).mutableArrayValue(forKey: "name")
        //
        //            for city in cities {
        //
        //                if let name = city as? String {
        //                    self.citiesArray.append(Cities(city: name))
        //                    print("reading from DB /name/ \(name)")
        //                }
        //            }
        //
        //        } catch let error {
        //            print(error.localizedDescription)
        //        }
    }
    
    private func realmDeleteAllFromDB() {
        
        //        do {
        //            let realm = try Realm()
        //            print(Realm.Configuration.defaultConfiguration.fileURL!)
        //            print("Try delete all data from base")
        //            try realm.write {
        //
        //                realm.deleteAll()
        //                print("finish, deleted all data from base")
        //            }
        //
        //        } catch let error {
        //            print(error)
        //        }
    }
    
    private func realmDeleteObjectFromDB() {
        
        //        do {
        //            let realm = try Realm()
        //            print(Realm.Configuration.defaultConfiguration.fileURL!)
        //            print("Try delete object in base")
        //            try realm.write {
        //
        //                let objectcToDelete = realm.objects(FullCitiesList.self)
        //
        //                for obj in objectcToDelete {
        //
        //                    realm.delete(obj)
        //                    print("deleting object from base")
        //                }
        //
        //                print("finish, deleted object from base")
        //            }
        //
        //        } catch let error {
        //            print(error)
        //        }
    }
    
    private func realmDeleteObjectFromDBWithFilter() {
        
        //        do {
        //            let realm = try Realm()
        //            print(Realm.Configuration.defaultConfiguration.fileURL!)
        //            print("Try delete object in base")
        //            try realm.write {
        //
        //                if let name = textFieldCity.text {
        //                    let objectcToDelete = realm.objects(City.self).filter("name = '\(name)'")
        //                    
        //                    for obj in objectcToDelete {
        //                        
        //                        realm.delete(obj)
        //                        print("deleting object \(obj) from base")
        //                    }
        //                    
        //                    print("finish, deleted object from base")
        //                }
        //            }
        //        } catch let error {
        //            print(error)
        //        }
    }
    
  
    
    
    
}
