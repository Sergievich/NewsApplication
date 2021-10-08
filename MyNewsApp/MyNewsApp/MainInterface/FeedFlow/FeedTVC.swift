//
//  FeedTVCTableViewController.swift
//  MyNewsApp
//
//  Created by Artiom on 15.09.21.
//

import UIKit

class FeedTVC: UITableViewController {
    
    var user = User(email: "", id: 0, name: "", groupsId: [0], password: "")
    
    static var goToGroup = false
    
 
    
    

    var usersGroups: [Group] = []
  //  private var usersPosts: [Posts] = []
    private var cell: [CellModel] = []
    var abc = false

    
    
    
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
        destination.group = group!
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
        
        usersGroups.count

    //    usersPosts.count
    }
    
     

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        
        
      
        let posts = usersGroups[indexPath.row]
       
        cell.newsText.text = posts.posts.text
        cell.likesCount.text =  String(posts.posts.likes)
        
        cell.fetchImage(imageUrl: posts.posts.image)
        cell.putGroupImage(image: posts.groupImage)
        cell.groupName.setTitle(posts.name, for: .normal)
        
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
    

    
    func checkUserGroups(){
        for group in ParsinhgServices.allGroups {
            
            if (user.groupsId!.contains(group.id)){
                usersGroups.append(group)
          
            
            }
    }

 }
}


