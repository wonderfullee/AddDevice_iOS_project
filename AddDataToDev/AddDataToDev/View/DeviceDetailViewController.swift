//
//  DeviceDetailViewController.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import UIKit
import Firebase

class DeviceDetailViewController: UIViewController {
    var listDevices = [DeviceModel]()
    var deviceId : String!

    @IBOutlet weak var lbl_deviceName: UILabel!
    
    @IBOutlet weak var lbl_lngVal: UILabel!

    @IBOutlet weak var lbl_latVal: UILabel!
    @IBOutlet weak var lbl_status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference().child("device-data").child(deviceId)
        ref.observe(.value) { (snapShot) in
            
            let key = snapShot.key
            guard let dictionary = snapShot.value as? Dictionary<String, AnyObject> else {return}
            let deviceData = DeviceDetailModel(deviceId: key, dictionary: dictionary )
            
            self.lbl_deviceName.text = deviceData.deviceName
            self.lbl_latVal.text = String(deviceData.lat)
            self.lbl_lngVal.text = String(deviceData.lng)
            self.lbl_status.text = deviceData.status
            
        }


//        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
