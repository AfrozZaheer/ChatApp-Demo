//
//  ConversationViewController.swift
//  ChatApp
//
//  Created by Afroz on 10/01/2022.
//

import UIKit

class ConversationViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var friend: Friend!
    fileprivate var messages:[Message] {
        get {
            return friend.messages ?? []
        }
    }
    //MARK: - Controller Flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = friend.name
        
    }
    
    
    
    //MARK: - IBActions
    
    @IBAction func sendMessage(_ sender: UIButton) {
        self.view.endEditing(true)
    }
    
    //MARK: - Methods


}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ConversationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let identifier = message.isMyMessage ? "ConversationTableViewCellMe" : "ConversationTableViewCellOther"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ConversationTableViewCell else {return UITableViewCell()}
        
        cell.name.text = message.isMyMessage ? "Me" : friend.name
        cell.message.text = message.message
        
        return cell

    }
}

//MARK: - UITextFieldDelegate

extension ConversationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt = textField.text, !txt.isEmpty {
            let msg = Message(text: txt)
            msg.isMyMessage = true
            
            let msg2 = Message(text: txt)
            msg2.isMyMessage = false
            
            friend.addMessage(msg)
            friend.addMessage(msg2)
            tableView.reloadData()
        }
    }
    
}
