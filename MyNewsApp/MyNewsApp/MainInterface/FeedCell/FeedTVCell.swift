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
    @IBOutlet weak var GroupName: UILabel!
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
    


    
}
