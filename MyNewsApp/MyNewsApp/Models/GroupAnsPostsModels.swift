//
//  GroupModel.swift
//  MyNewsApp
//
//  Created by Artiom on 14.09.21.
//

import Foundation
import UIKit

struct Group: Decodable {
    let id: Int
    let name: String
    var groupImage: String
    var posts: Posts
    var tag: String
}


struct Posts: Decodable{
   // var groupId: Int
    var id: Int
    var text: String
    var image: String
    var likes: Int
}

struct FinalPosts {
    
    var groupId: Int
    var id: Int
    var text: String
    var image: UIImage
    var likes: Int
    
}
