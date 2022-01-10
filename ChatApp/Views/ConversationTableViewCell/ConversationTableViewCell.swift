//
//  ConversationTableViewCell.swift
//  ChatApp
//
//  Created by Afroz on 10/01/2022.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.layer.borderColor = UIColor.black.cgColor
        name.layer.borderWidth = 1        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
