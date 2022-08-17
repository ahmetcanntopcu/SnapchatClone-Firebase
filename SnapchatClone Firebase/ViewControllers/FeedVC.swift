//
//  FeedVC.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 16.08.2022.
//

import UIKit
import Firebase

class FeedVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let firestoreDatabase = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    func getUserDetail(){
        firestoreDatabase.collection("UserDetail").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snapshot , error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents {
                        if let userName = document.get("username") as? String {
                            UserSingleton.sharedUserDetail.email = Auth.auth().currentUser!.email!
                            UserSingleton.sharedUserDetail.username = userName
                        }
                    }
                }
            }
        }
    }
    func makeAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
