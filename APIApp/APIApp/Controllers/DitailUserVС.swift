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
    
    @IBAction func todoAcrtion() {
    }
    
    @IBAction func albumAction() {
    }
    
    func updateLbl() {
        name.text = user?.name
        username.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ToDoTableVC else { return }
        vc.user = user
    }

}
