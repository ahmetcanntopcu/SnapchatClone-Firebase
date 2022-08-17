//
//  UploadVC.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 16.08.2022.
//

import UIKit

class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageViewUpload: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewUpload.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        imageViewUpload.addGestureRecognizer(gestureRecognizer)

    }
    @objc func choosePicture(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageViewUpload.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
    }
    

}
