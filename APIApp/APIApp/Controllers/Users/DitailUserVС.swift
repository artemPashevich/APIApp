//
//  DitailUserVС.swift
//  APIApp
//
//  Created by Артем Пашевич on 4.09.22.
//

import UIKit

class DitailUserV_: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLbl()
        
    }
    
    @IBAction func albumAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlbumsCollectionVC") as! AlbumsCollectionVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func todoAcrtion() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ToDoTableVC") as! ToDoTableVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func postAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostTVC") as! PostTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateLbl() {
        name.text = user?.name
        username.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
    }
    

}
