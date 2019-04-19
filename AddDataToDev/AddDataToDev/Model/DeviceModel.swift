//
//  Device.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import Foundation
class DeviceModel{
    
    var deviceName : String!
    var version: String!
    var deviceId: String!
    var status: String!
    
    init(deviceId: String!, dictionary: Dictionary<String, AnyObject> ) {
        self.deviceId = deviceId
        print(deviceId)
        if let deviceName = dictionary["deviceName"] as? String{
            self.deviceName = deviceName
        }
        
        if let version = dictionary["version"] as? String{
            self.version = version
        }
        if let status = dictionary["status"] as? String{
            self.status = status
        }
        
    }
}

