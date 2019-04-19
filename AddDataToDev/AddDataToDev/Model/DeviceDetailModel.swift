//
//  DeviceDetailModel.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import Foundation
class DeviceDetailModel{
    
    var deviceName: String!
    var lat: Double!
    var lng: Double!
    var status: String!
    var deviceId: String!
    
    init(deviceId: String!, dictionary: Dictionary<String, AnyObject> ) {
        self.deviceId = deviceId
        
        if let deviceName = dictionary["deviceName"] as? String{
            self.deviceName = deviceName
        }
        
        if let lat = dictionary["lat"] as? Double{
            self.lat = lat
        }
        if let lng = dictionary["lng"] as? Double{
            self.lng = lng
        }
        if let status = dictionary["status"] as? String{
            self.status = status
        }
        
    }
}

