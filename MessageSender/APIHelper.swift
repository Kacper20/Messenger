//
//  APIHelper.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
struct APIKeys{
    static let protocolVersionKey = "protocolVersion"
    static let protocolNowTimeKey = "nowTime"
    static let supportedProtocolVersion = "1"
    static let tokenKey = "token"
    static let expiredTokenDateKey = "expiringDate"
    static let errorNumer = "errno"
    static let additionalInfo = "info"
}
struct APIUrls{
    static let protocolVersionUrl = "http://znfgnu.ovh:8080/info"
    static let loginUrl = "http://znfgnu.ovh:8080/login"
}
class APIHelper{
    
    class func getProtocolVersionUrlRequest() -> NSURLRequest
    {
        return NSURLRequest(URL: NSURL(string: APIUrls.protocolVersionUrl)!)
    }
    
    /* Function that takes care of loggin user in */
    class func postLoginData(login: String, password: String, completed: (success: Bool, message: String) -> ()){
        completed(success: true, message: "YES")
//        var request = NSMutableURLRequest(URL: NSURL(string: APIUrls.loginUrl)!)
//        var session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        var params = ["login": login, "password":password, "protocolVersion":APIKeys.supportedProtocolVersion]
//        var error: NSError?
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &error)
//        if error != nil{
//            completed(success: false, message: "problem with parsing")
//            return
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        var task = session.dataTaskWithRequest(request, completionHandler: { (data, response: NSURLResponse!, error) -> Void in
//            // Checking data task errors
//            if error != nil{
//                println("Data task with request error: \(error.localizedDescription)")
//                completed(success: false, message: "Data task error")
//            }
//            if let httpResponse = response as? NSHTTPURLResponse {
//                let statusCode = httpResponse.statusCode
//                if statusCode == 200{
//                    var json = JSON(data: data)
//                    var token = json[APIKeys.tokenKey].int
//                    var expiredDate = json[APIKeys.expiredTokenDateKey].int
//                    completed(success: true, message: "OK")
//                }
//                else if statusCode == 400{
//                    var json = JSON(data:data)
//                    var errno = json[APIKeys.errorNumer].int
//                    var info = json[APIKeys.additionalInfo].string
//                    if errno == 3 || errno == 4{
//                        println("Errno: \(errno)")
//                        completed(success: false, message: "wrong username or password")
//                    }
//                    return
//                }
//                else{
//                
//                    completed(success: false, message: "Status code != 200")
//                    return
//                }
//                
//            }
//            else{
//                println("no cast!")
//            }
//            
//            
//        })
//        task.resume()
    }
    
    
    
}