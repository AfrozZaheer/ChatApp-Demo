//
//  ViewController.swift
//  ChatApp
//
//  Created by Afroz on 04/01/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var friends = [Friend]()
    
    //MARK: - Controller Flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initilizeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    //MARK: - IBActions
    
    //MARK: - Methods
    
    fileprivate func initilizeData() {
        let f1 = Friend(name: "John", firstMessage: "Hello")
        let f2 = Friend(name: "Kent", messages: nil)
        self.friends.append(f1)
        self.friends.append(f2)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {return UITableViewCell()}
        let friend = friends[indexPath.row]
        
        cell.friendName.text = friend.name
        if let lastMsg = friend.lastMassage {
            cell.lastMessage.text = lastMsg.message
            cell.lastMessage.textColor = .black
        } else {
            cell.lastMessage.text = "Click to start conversation"
            cell.lastMessage.textColor = .lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "ConversationViewController") as? ConversationViewController else {return }
        controller.friend = friends[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

