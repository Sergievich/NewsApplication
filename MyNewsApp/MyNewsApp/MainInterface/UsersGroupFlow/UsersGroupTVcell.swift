//
//  UsersGroupTVcell.swift
//  MyNewsApp
//
//  Created by Artiom on 11.10.21.
//

import UIKit

class UsersGroupTVcell: UITableViewCell {
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
