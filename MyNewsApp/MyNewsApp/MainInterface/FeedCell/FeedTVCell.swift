//
//  FeedTVCell.swift
//  MyNewsApp
//
//  Created by Artiom on 13.09.21.
//

import UIKit

class FeedTVCell: UITableViewCell {
    @IBOutlet weak var likesCount: UILabel!
   
    @IBOutlet weak var newsText: UILabel!
    
    @IBOutlet weak var groupName: UIButton!
    @IBOutlet weak var timeOfUploadingPost: UILabel!
    @IBOutlet weak var ImageOfGroup: UIImageView!
    @IBOutlet weak var likeBtnColor: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    
    var likeIsActive = false
    
    private let jsonGroupsUrl = "http://localhost:3000/groups"
    private var groups: [Group] = []
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if !likeIsActive{
            likeBtnColor.tintColor = .gray
        } else {
            likeBtnColor.tintColor = .blue
        }
        

     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeBtnPressed(_ sender: UIButton) {
        likeIsActive.toggle()
    }
    
    @IBAction func goToGroup(_ sender: UIButton) {
        
        
    }
    
     func fetchImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }

        let session = URLSession.shared // синглтон

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
                    self.newsImage.image = image
                }
            }
        }.resume()
    }
    
    public func putGroupImage(image: String) {
            guard let urlImg = URL(string: image) else { return }
            URLSession.shared.dataTask(with: urlImg) { data, _, _ in
                let queue = DispatchQueue.global(qos: .utility)
                queue.async {
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.ImageOfGroup.image = image
                        }
                    }
                }
}



}
}
