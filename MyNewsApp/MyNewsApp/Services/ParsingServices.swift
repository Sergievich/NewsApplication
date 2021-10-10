//
//  ParsingServices.swift
//  MyNewsApp
//
//  Created by Artiom on 2.10.21.
//

import Foundation
import AlamofireImage
import UIKit


class ParsinhgServices{
    static var allGroups: [Group] = []
    static var allPosts: [Posts] = []
    static var allUsers: [User] = []
    static var finalAllPosts: [FinalPosts] = []
 
    
    let imageTest = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fauto.onliner.by%2F2020%2F06%2F17%2Fistoriya-belorusskogo-avtozaka&psig=AOvVaw2GSEN6WXv_877x-d4aEdPl&ust=1632331515500000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNi7q_TKkPMCFQAAAAAdAAAAABAJ"
    
    var newImage: [UIImage] = []
    

    
   
    
    
    //MARK: GET GROUPS
   static func getGroups() {

        guard let url = URL(string: ApiConstants.groupPath) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print("Все группы\(data)")
            do {
                ParsinhgServices.allGroups = try JSONDecoder().decode([Group].self, from: data)
                print("Гоыно из жопы\(ParsinhgServices.allGroups)")
            } catch let error {
                print(error)
            }
        }
        task.resume()
       }
    
    
    //MARK: GET POSTS
    static func getPosts() {

        guard let url = URL(string: ApiConstants.postPath) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                ParsinhgServices.allPosts = try JSONDecoder().decode([Posts].self, from: data)
                print(ParsinhgServices.allPosts)
            } catch let error {
                print(error)
            }
        }
        task.resume()
       }
    
    //MARK: GET USERS
    
    static func getUsers() {

        guard let url = URL(string: ApiConstants.userPath) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print("\(data)")
            do {
                ParsinhgServices.allUsers = try JSONDecoder().decode([User].self, from: data)
                print(ParsinhgServices.allUsers)
            } catch let error {
                print(error)
            }
        }
        task.resume()
       }
    
  
    

}
    

    
    

