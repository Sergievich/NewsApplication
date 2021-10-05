//
//  ApiConstans.swift
//  MyNewsApp
//
//  Created by Artiom on 14.09.21.
//

import Foundation


class ApiConstants{

static let serverPath = "http://localhost:3000/"
static let postPath = serverPath + "posts"
static let groupPath = serverPath + "groups"
static let userPath = serverPath + "user"

    static let postPathURL = URL(string: postPath)
    static let groupPathURL = URL(string: groupPath)
   
    static let userPathURL = URL(string: userPath)
}

