//
//  FeedTVCTableViewController.swift
//  MyNewsApp
//
//  Created by Artiom on 15.09.21.
//

import UIKit

class FeedTVC: UITableViewController {
    
    var user = User(email: "", id: 0, name: "", groupsId: [0], password: "")
    
    private let jsonGroupsUrl = "http://localhost:3000/groups"
    private var allGroups: [Group] = []
    private var allPosts: [Posts] = []
    private var usersGroups: [Group] = []
    private var usersPosts: [Posts] = []
    
    
    override func viewDidLoad() {
        getGroups()
        getPosts()
        print (getGroups)
        
      //  chekNews()
        print(allGroups)
//        print(user)
        
    //    print("Группы этого юзера \(simpleGroups)")
        
        tableView.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of rows
        usersPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        let posts = usersPosts[indexPath.row]
        cell.newsText.text = posts.text
        cell.likesCount.text = String(posts.likes)
//        cell.newsImage
        
        

        return cell
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
    
    func getPosts() {

        guard let url = URL(string: ApiConstants.postPath) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                self.allPosts = try JSONDecoder().decode([Posts].self, from: data)
                print(self.allPosts)
            } catch let error {
                print(error)
            }
        }
        task.resume()
       }
    
    
    func getGroups() {

        guard let url = URL(string: jsonGroupsUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                self.allGroups = try JSONDecoder().decode([Group].self, from: data)
                print(self.allGroups)
            } catch let error {
                print(error)
            }
        }
        task.resume()
       }
    
    func checkUserNews(){
        var groupId = [0]
        for group in usersGroups{
            groupId.append(group.id)
            print (groupId)
        }
        for post in allPosts {
            if groupId.contains(post.groupId){
                usersPosts.append(post)
                
            }
        }
    }
    
    
    
    func checkUserGroups(){
        for group in allGroups {
            if (user.groupsId!.contains(group.id)){
                usersGroups.append(group)
            }
    }

}
}
