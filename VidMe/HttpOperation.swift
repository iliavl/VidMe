//
//  HttpOperation.swift
//  VidMe
//
//  Created by LIV on 15.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//

import UIKit
import Alamofire

class HttpOperation: NSObject {

    static let sharedInstance = HttpOperation()
    
    func downloadSetImageVideoCell(url: URL, cell: VideoCell) {
        
        print("Download Started \(url)")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                cell.imageThumbnail.image = UIImage(data: data)!
            }
        }
    }
    
    private func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func Login(complition: @escaping (_ access: Bool) -> Void) {
        
        print("_________Logining____________")
        let user = Constants.shared.username
        let password = Constants.shared.password
        
//        let user = Constants.shared.username
//        let password = "" iliavl 140115
        
//        let url = URL(string: "https://api.vid.me/auth/create?username=\(user)&password=\(password)")
        
        let parameters = ["username": user, "password": password]
        
        let url = "https://api.vid.me/auth/create"
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
            headers["AccessToken"] = Constants.shared.accessToken
        }
//        .POST, "http://myserver.com", parameters: parameters, encoding: .JSON
//        Alamofire.request(url!, .post, headers: headers).validate(statusCode: 200..<600)
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error *******: \(response.result.error)")
                    //completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: Any]
                    else {
                        return
                }
                
                let access = value["status"] as! Bool
                
//                print(response)
//                print(value)
                print("access = \(access)")
                complition(access)

        }
    }
    
    func logout() {
        
        let username = ""
        let password = ""
        let access = false
        Constants.shared.access = access
        Constants.shared.username = username
        Constants.shared.password = password
        UserDefaults.standard.setValue(username, forKey: "username")
        UserDefaults.standard.setValue(password, forKey: "password")
        UserDefaults.standard.setValue(access, forKey: "access")

        print("logout")
    }
    
}
