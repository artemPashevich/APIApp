//
//  AddCommentVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 10.09.22.
//

import UIKit

class AddCommentVC: UIViewController {

    var user: User?
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func postURLSession() {
        if let userId = user?.id,
           let title = titleTF.text,
           let text = bodyTV.text
        {
            NetworkService.addPost(userId: userId, title: title, text: text) { result, error in
                
                if let result = result {
                    print(result)
                    self.navigationController?.popViewController(animated: true)
                } else {
                    print(error!)
                }
                
            }
            
            
            
        }
    

    }
}
