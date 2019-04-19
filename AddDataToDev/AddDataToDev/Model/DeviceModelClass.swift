//
//  DeviceModelClass.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//
import UIKit
import Foundation
class DeviceModelClass{
    var deviceName : String = ""
    var image : UIImage?
    
    init(deviceName: String, image: String) {
        self.deviceName = deviceName
        self.image = UIImage(named: image)
    }
}

