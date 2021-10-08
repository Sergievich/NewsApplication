//
//  GroupVC.swift
//  MyNewsApp
//
//  Created by Artiom on 6.10.21.
//

import UIKit

class GroupVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var group = Group(id: 0, name: "", groupImage: "", posts: Posts(id: 0, text: "", image: "", likes: 0), tag: "")
  
    
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var groupImage: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
       
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        
        let group = group
        
        cell.fetchImage(imageUrl: group.posts.image)
        cell.newsText.text = group.posts.text
        cell.likesCount.text = String(group.posts.likes)
        
        return cell
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
