//
//  SnapVC.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 16.08.2022.
//

import UIKit

class SnapVC: UIViewController {

    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var selectedSnap : Snap?
    var selectedTime : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let time = selectedTime {
            timeLeftLabel.text = "Time Left: \(time)"

        }

    }
    


}
