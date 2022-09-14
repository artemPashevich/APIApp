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
    }

    override func viewWillAppear(_ animated: Bool) {
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, let id = posts[indexPath.row]["id"].int {
            NetworkService.deletePost(postID: id) { [weak self] json, error in
                if json != nil {
                    self?.posts.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                } else if let error = error {
                    print(error)
                }
            }
        }
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

    
    @IBAction func addNewPost(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCommentVC") as! AddCommentVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
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
