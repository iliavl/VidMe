//
//  VideoListView.swift
//  VidMe
//
//  Created by LIV on 12.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer
import CoreData
import RealmSwift

class VideoListView: UITableViewController {
    
    //@IBOutlet weak var tableViewVideoList: UITableView!
    @IBOutlet var tableViewVideoList: UITableView!
    
    var array = [String]()
    var vidMeArray = [VideoCellAttribute]()
    var dict = [String: [String]]()
    var jsonLoader = JsonOperation()
   
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        readFromDBCoreData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadDefault()
        
        setupUI()
        
//        HttpOperation.sharedInstance.Login()
        
        tableViewVideoList.delegate = self as? UITableViewDelegate
        tableViewVideoList.dataSource = self
        
        loadFromJsonInTable(urlString: "")
        
        print("finish - viewDidLoad")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("VideoCell", owner: self, options: nil)?.first as! VideoCell
        
        cell.imageThumbnail.clipsToBounds = true
        
        let title = vidMeArray[indexPath.row].title
        
        cell.labelTitle.text = title
        
        let thumbnailUrl = vidMeArray[indexPath.row].thumbnailUrl
        
        if let checkedUrl = URL(string: thumbnailUrl) {
            
            HttpOperation.sharedInstance.downloadSetImageVideoCell(url: checkedUrl, cell: cell)
        }
        
        cell.buttonSaveToDB.tag = indexPath.row
        cell.buttonSaveToDB.addTarget(self, action: #selector(buttonClickSaveToDB(sender: )), for: UIControlEvents.touchUpInside)
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.red.cgColor
//        cell.buttonSaveToDB.layer.borderWidth = 2.5
//        cell.buttonSaveToDB.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vidMeArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = vidMeArray[indexPath.row].videoUrl
        
        if let videoURL = URL(string: url) {
            
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                
                playerViewController.player?.play()
            }
        }
    }
 
    func buttonClickSaveToDB(sender: UIButton) {
       
        writeToDBCoreData()
        let dB = DataBase()
        let ind = sender.tag
        let data = vidMeArray[ind]
        
        dB.realmAddToDBFav(id: data.id, name: data.title, thumbnailUrl: data.thumbnailUrl, videoUrl: data.videoUrl)
    }

    func writeToDBCoreData() {
        
        print("save to DB -=-=-=-=-=-=-=-=-=-=-=-=-")
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: managedContext)
        
        //let vidMe = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        entity.setValue("test", forKey: "name")
        entity.setValue("test", forKey: "thumbnailUrl")
        entity.setValue("test", forKey: "videoUrl")
        
        print(entity)
        
        do {
            try managedContext.save()
            print("saving to DB")
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func readFromDBCoreData() {
        
        var videos: [NSManagedObject] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
        
        do {
            
            print("loading from DB")
            videos = try managedContext.fetch(fetchRequest)
            
            for item in videos {
                
                print("name          \(item)")
            }

        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func loadFromJsonInTable(urlString: String) {
        
        JsonOperation.sharedInstance.loadDataJsonNewVideo(urlString: urlString) {[weak self] (dataForTable) in
        
            guard let `self` = self else { return }
            
            DispatchQueue.main.async {
                
                self.vidMeArray = dataForTable
                self.tableViewVideoList.reloadData()
            }
        }
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

    func loadDefault() {
        
        guard let username = UserDefaults.standard.object(forKey: "username") as? String else {
            return
        }
        
        Constants.shared.username = username
        
        guard let password = UserDefaults.standard.object(forKey: "password") as? String else {
            return
        }
        
        Constants.shared.password = password
        
        guard let access = UserDefaults.standard.object(forKey: "access") as? Bool else {
            return
        }
        
        Constants.shared.access = access
    }
    
    func setupUI() {
    
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
//        tableViewVideoList.backgroundColor = UIColor.white
//        tableViewVideoList.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
//        tableViewVideoList.contentInset.top = UIApplication.shared.statusBarFrame.height
//        setTabBarVisible(visible: !tabBarIsVisible(), animated: true)

    }
    
    func tabBarIsVisible() -> Bool {
        
        return (self.tabBarController?.tabBar.frame.origin.y)! < self.view.frame.maxY
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        //        let duration:NSTimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animate(withDuration: 0.3) {
                self.tabBarController?.tabBar.frame = frame!.offsetBy(dx: 0, dy: offsetY!)
                return
            }
        }
    }

}
