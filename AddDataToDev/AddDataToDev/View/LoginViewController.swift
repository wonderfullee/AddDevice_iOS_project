//
//  LoginViewController.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableData: UITableView!
    
    var listDevices = [DeviceModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableData.dataSource = self
        tableData.delegate = self

        let ref = Database.database().reference().child("device")
        ref.observe(.childAdded) { (snapShot) in

            let key = snapShot.key
            guard let dictionary = snapShot.value as? Dictionary<String, AnyObject> else {return}
            let deviceModel = DeviceModel(deviceId: key, dictionary: dictionary )

            self.listDevices.append(deviceModel)

            // self.rows.append(post.title)
            self.tableData.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDevices.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        cell.lblDeviceName.text = listDevices[indexPath.row].deviceName
  //      cell.imageDevice.image = listDevices[indexPath.row].image
        let status = listDevices[indexPath.row].status
        switch status {
        case "Digging":
            cell.imgDevice.image = UIImage(named: "BLUE_PNG")
            break
        case "Alert":
            cell.imgDevice.image = UIImage(named: "RED_PNG")
            break
        case "Idle":
            cell.imgDevice.image = UIImage(named: "YELLOW_PNG")
            break
        default:
            cell.imgDevice.image = UIImage(named: "GREY_PNG")
        }

        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row
        print("Row: \(row)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let deviceDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DeviceDetailViewController") as! DeviceDetailViewController


        deviceDetailsViewController.deviceId = listDevices[row].deviceId

        self.navigationController!.pushViewController(deviceDetailsViewController, animated: true)
    }
    
    @IBAction func toggleData(_ sender: UISwitch) {
    }
    
    @IBAction func logout_pressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try
                firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            return
        }
        
        KeyChainService().keyChain.delete("uid")
        self.navigationController?.popViewController(animated: true)
        

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
