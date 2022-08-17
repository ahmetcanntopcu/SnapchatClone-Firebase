//
//  UserSingleton.swift
//  SnapchatClone Firebase
//
//  Created by Ahmet Can Topcu on 17.08.2022.
//

import Foundation

class UserSingleton{
    
    static let sharedUserDetail = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init(){
        
    }
}
