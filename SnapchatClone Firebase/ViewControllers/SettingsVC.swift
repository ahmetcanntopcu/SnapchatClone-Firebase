//
//  SettingsVC.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 16.08.2022.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
        
    }
    
}
