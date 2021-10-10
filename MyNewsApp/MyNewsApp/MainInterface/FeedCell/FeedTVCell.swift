//
//  FeedTVCell.swift
//  MyNewsApp
//
//  Created by Artiom on 13.09.21.
//

import UIKit

protocol GoToGroupDelegate{
    func didPressedBtn(btn: UIButton)
}

class FeedTVCell: UITableViewCell {
    @IBOutlet weak var likesCount: UILabel!
   
    @IBOutlet weak var newsText: UILabel!
    
    @IBOutlet weak var groupName: UIButton!
    @IBOutlet weak var timeOfUploadingPost: UILabel!
    @IBOutlet weak var ImageOfGroup: UIImageView!
    @IBOutlet weak var likeBtnColor: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    
    var delegate: GoToGroupDelegate?
    var likeIsActive = false
  static   var goToGroupPressed = false
    
    private let jsonGroupsUrl = "http://localhost:3000/groups"
    private var groups: [Group] = []
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageOfGroup.layer.borderWidth = 1
        ImageOfGroup.layer.masksToBounds = true
        ImageOfGroup.layer.cornerRadius = ImageOfGroup.frame.height/2
        ImageOfGroup.clipsToBounds = true
        
        likeBtnColor.setTitle("", for: .normal)
        
        
        
        if !likeIsActive{
            likeBtnColor.tintColor = .gray
        } else {
            likeBtnColor.tintColor = .blue
        }
        

     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }
    
    @IBAction func likeBtnPressed(_ sender: UIButton) {
    }
    
    
    
    @IBAction func goToGroup(_ sender: UIButton) {
        delegate?.didPressedBtn(btn: groupName)
        }
        
    
    
    
     func fetchImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }

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
                    self.newsImage.image = image
                }
            }
        }.resume()
    }
    
    func putGroupImage(image: String) {
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
                   self.ImageOfGroup.image = image
               }
           }
       }.resume()
   }
}

