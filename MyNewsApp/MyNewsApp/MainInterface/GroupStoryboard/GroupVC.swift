//
//  GroupVC.swift
//  MyNewsApp
//
//  Created by Artiom on 6.10.21.
//

import UIKit

class GroupVC: UIViewController {
    
    var groups: [Group] = []
    
    var grouping = 0
  
    
    
    @IBOutlet weak var tableViewGroup: UITableView!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        newsTableView.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
  
       
        super.viewDidLoad()
        
        for group in ParsinhgServices.allGroups{
            if group.id == grouping{
                groups.append(group)
            }
        }
        groupName.text = groups[0].name
        putGroupImage(image: groups[0].groupImage)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
        var posts: [Posts] = []
        for post in groups{
            posts += post.posts
        }
        let truePost = posts[indexPath.row]
        
        
            cell.newsText.text = truePost.text
            cell.likesCount.text = String(truePost.likes)
            cell.fetchImage(imageUrl: truePost.image)
        
      
                
                
                
      cell.putGroupImage(image: groups[0].groupImage)
        cell.groupName.setTitle(groups[0].name, for: .normal)
        
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
    
    
    //MARK: GET IMAGES
    
    private func putGroupImage(image: String) {
       guard let url = URL(string: image) else { return }

       let session = URLSession.shared

       session.dataTask(with: url) { (data, response, error) in
           if let error = error {
               print(error.localizedDescription)
               return
           }
           if let response = response {
               print(response)
           }
           if let data = data, let image = UIImage(data: data) {
               DispatchQueue.main.async {
                  // self.activityIndicator.stopAnimating()
                   self.groupImage.image = image
               }
           }
       }.resume()
   }
    


}

extension GroupVC:

    UITableViewDelegate, UITableViewDataSource{
    
}
