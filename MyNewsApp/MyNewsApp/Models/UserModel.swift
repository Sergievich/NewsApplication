//
//  UserModel.swift
//  MyNewsApp
//
//  Created by Artiom on 14.09.21.
//

import Foundation

struct User: Decodable{
    var email: String
    var id: Int
    var name: String
 //   var nickName: String
   var groupsId: [Int]?
    var password: String
   // var tags: [Tags]
}

struct UserWithoutDec {
    var email: String
    var id: Int
    var name: String
 //   var nickName: String
   var groupsId: [Int]?
    var password: String
   // var tags: [Tags]
}
