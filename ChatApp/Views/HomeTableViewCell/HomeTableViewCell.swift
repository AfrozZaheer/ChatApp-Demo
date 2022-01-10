//
//  HomeTableViewCell.swift
//  ChatApp
//
//  Created by Afroz on 10/01/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var lastMessage: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
