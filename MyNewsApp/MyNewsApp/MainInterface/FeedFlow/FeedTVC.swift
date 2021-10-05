//
//  FeedTVCTableViewController.swift
//  MyNewsApp
//
//  Created by Artiom on 15.09.21.
//

import UIKit

class FeedTVC: UITableViewController {
    
    var user = User(email: "", id: 0, name: "", groupsId: [0], password: "")
    
    

    var usersGroups: [Group] = []
    private var usersPosts: [Posts] = []
    private var cell: [CellModel] = []
    var abc = false

    
    
    
    override func viewDidLoad() {
        ParsinhgServices.getGroups()
        print("Все группы \(ParsinhgServices.allGroups)")
        ParsinhgServices.getPosts()
        print("Все посты \(ParsinhgServices.allPosts)")
        checkUserGroups()
        checkUserNews()
        tableView.reloadData()
        
        

        
        tableView.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
        super.viewDidLoad()
        
//        print(usersGroups)
//        print(usersPosts)
        print(user)
        
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    @IBAction func chekNews(_ sender: Any) {
        checkUserGroups()
        checkUserNews()
       

        print("Группы этого юзера \(usersGroups)")
        print("Посты этого юзера \(usersPosts)")
        tableView.reloadData()
        
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        usersPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        
        
        let group = usersGroups[indexPath.row]
        let posts = usersPosts[indexPath.row]
        if posts.groupId == group.id {
        cell.newsText.text = posts.text
        cell.likesCount.text = String(posts.likes)
        
        cell.fetchImage(imageUrl: posts.image)
        cell.putGroupImage(image: group.groupImage)
        cell.groupName.setTitle(group.name, for: .normal)
        }
//        cell.newsImage
        
        

        return cell
    }
    
    func checkPostAndGroup(post: Posts, group: Group) -> Bool{
        if post.groupId == group.id{
          abc = true
        }
        return abc
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func checkUserNews(){
        var groupId = [0]
        for group in usersGroups{
            groupId.append(group.id)
            print (groupId)
        }
        for post in ParsinhgServices.allPosts {
            if groupId.contains(post.groupId){
                usersPosts.append(post)
                
            }
        }
    }
    
    
    
    func checkUserGroups(){
        for group in ParsinhgServices.allGroups {
            
            if (user.groupsId!.contains(group.id)){
                usersGroups.append(group)
          
            
            }
    }

 }
}


