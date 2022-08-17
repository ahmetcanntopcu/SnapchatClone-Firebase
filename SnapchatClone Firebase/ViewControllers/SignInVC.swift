//
//  ViewController.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 16.08.2022.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { result, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ??  "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            self.makeAlert(title: "Error", message: "Username/Password/Email ?")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { [self] auth, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["email" : self.emailText.text! , "username" : self.usernameText.text!] as [String : Any]
                    fireStore.collection("userInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            //
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else{
            self.makeAlert(title: "Error", message: "Username/Password/Email ?")
        }
        
    }
    func makeAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

