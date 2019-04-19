//
//  ViewController.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/16/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var lbl_status: UILabel!
    @IBOutlet weak var txt_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func AddKeyChainAfterLogin(uid: String){
        let keyChain = KeyChainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = KeyChainService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "login", sender: self)
        }
    }

    @IBAction func login_pressed(_ sender: Any) {
        let email = txt_email.text!
        let password = txt_password.text!
        
        if email.isEmail == false{
            lbl_status.text = "Enter a valid e mail"
            lbl_status.isHidden = false
            return
        }
        if password.count < 6 {
            lbl_status.text = "Enter password"
            lbl_status.isHidden = false
            return
        }
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            SVProgressHUD.dismiss()
            if error == nil{
                // perform segue
                strongSelf.AddKeyChainAfterLogin(uid: user!.user.uid)
                strongSelf.performSegue(withIdentifier: "login", sender: strongSelf)
            }
            else{
                strongSelf.lbl_status.text = error?.localizedDescription
                return
            }
        }
        

    }
    

}

