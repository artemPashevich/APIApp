//
//  PostTVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 6.09.22.
//

import UIKit
import SwiftyJSON

class PostTVC: UITableViewController {
    
    var user: User?
    var posts: [JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        getPost()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as! PostTVCell
        
        cell.titleLbl.text = posts[indexPath.row]["title"].stringValue
        cell.bodyLbl.text = posts[indexPath.row]["body"].stringValue

        return cell
    }


    func getPost() {
        
        guard let userId = user?.id else { return }
        NetworkService.getPost(userId: userId) { result, error in
            if let result = result {
                self.posts = JSON(result).arrayValue
                self.tableView.reloadData()
            } else {
                print("error")
            }
        }
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
