//
//  FeedTVCTableViewController.swift
//  MyNewsApp
//
//  Created by Artiom on 15.09.21.
//

import UIKit

class FeedTVC: UITableViewController, GoToGroupDelegate {
    func didPressedBtn(btn: UIButton) {
        
        self.performSegue(withIdentifier: "goToGroup", sender: UIButton())
        
    }
    
    
    var user = User(email: "", id: 0, name: "", groupsId: [0], password: "")

    var usersGroups: [Group] = []
    var postss: [Posts] = []

 
    override func viewDidLoad() {
        ParsinhgServices.getGroups()
        print("Все группы \(ParsinhgServices.allGroups)")
        tableView.reloadData()
        tableView.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
        super.viewDidLoad()
        

        print(user)
        
        tableView.reloadData()

    }
    
 
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToGroup" else { return }
        if let destination = segue.destination as? GroupVC {
        let group = sender as? Group
            destination.grouping = group?.id ?? 0
    }
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    @IBAction func chekNews(_ sender: Any) {
        checkUserGroups()
//        checkUserNews()
       

        print("Группы этого юзера \(usersGroups)")
     //   print("Посты этого юзера \(usersPosts)")
        tableView.reloadData()
        
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var grouper = 0
        var rows = 0
        grouper = usersGroups.count
        for grpoup in usersGroups{
            rows += grpoup.posts.count
            print ("Aaaaaaaaaaaaaaaaaaaa\(grpoup.posts.count)")
        }
        return rows
    //    usersPosts.count
    }
    
     

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        
        
        
        for group in usersGroups{
            postss += group.posts
        }
        let postsIndex = postss[indexPath.row]
        for group in usersGroups{
        if postsIndex.groupId == group.id{
                cell.newsText.text = postsIndex.text
                cell.likesCount.text = String(postsIndex.likes)
                cell.fetchImage(imageUrl: postsIndex.image)
            cell.putGroupImage(image: group.groupImage)
            cell.groupName.setTitle(group.name, for: .normal)
        }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var abc: [Group] = []
        var iterations = 0
        
        usersGroups.forEach({group in
            repeat {
                abc.append(group)
                iterations = iterations + 1
            } while iterations < group.posts.count 
            })
        
        
        let group = abc[indexPath.row]
            performSegue(withIdentifier: "goToGroup", sender: group)
    }
    
    
    func checkUserGroups(){
        for group in ParsinhgServices.allGroups {
            
            if user.groupsId!.contains(group.id){
                usersGroups.append(group)
          
            
            }
    }

 }
}

////usersGroups.forEach({group in
//repeat {
//    abc.append(group)
//    iterations = iterations + 1
//} while iterations == group.posts.count
//})


