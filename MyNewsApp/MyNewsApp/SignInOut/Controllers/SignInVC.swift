//
//  SignInVC.swift
//  MyNewsApp
//
//  Created by Artiom on 7.09.21.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var signInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.layer.cornerRadius = 15
    }
    
    func emailTFisTapped(){
        if emailOutlet.isSelected {
            emailOutlet.text = ""
        }
    }
    



   
    @IBAction func signInBtn(_ sender: Any) {
    }
    
}
