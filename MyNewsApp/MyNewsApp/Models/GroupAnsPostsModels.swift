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
    let description: String
    let groupImage: String
    let posts: [Posts]
    let tag: String
}


struct Posts: Decodable{
    let groupId: Int
    let id: Int
    let text: String
    let image: String
    let likes: Int
}

struct FinalPosts {
    
    let groupId: Int
    let id: Int
    let text: String
    let image: UIImage
    let likes: Int
    
}
