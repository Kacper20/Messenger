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
}
struct APIUrls{
    static let protocolVersionUrl = "http://znfgnu.ovh:8080/info"
}

class APIHelper{
    
    class func getProtocolVersionUrl() -> NSURLRequest
    {
        return NSURLRequest(URL: NSURL(string: APIUrls.protocolVersionUrl)!)
    }
    
    
}