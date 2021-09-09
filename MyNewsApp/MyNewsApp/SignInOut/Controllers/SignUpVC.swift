//
//  SignUpVC.swift
//  MyNewsApp
//
//  Created by Artiom on 8.09.21.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var passworOutlet: UITextField!
    @IBOutlet weak var passwordConfirmOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!
    
    
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var signUpOutlet: UIButton!
    
    @IBOutlet var verifPassView: [UIView]!
    @IBOutlet weak var verifPassError: UILabel!
    
    var canSignUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in verifPassView{
            i.layer.cornerRadius = 5
            i.alpha = 30
        }

        btnView.layer.cornerRadius = 15
    
}
    
    func signInAccept(){
        
        if !canSignUp  {
            signUpOutlet.isEnabled = false
        } else  {
            singUpFunc()
        }
        
    }
    
    @IBAction func singUpFunc() {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func fullSignUp(_ sender: Any) {
        signInAccept()
    }
    @IBAction func signInBtnTouch() {
        singUpFunc()
    }
    
    
    @IBAction func emailTFChanged(_ sender: Any) {
    }
    
    
    @IBAction func nameTFChanged(_ sender: UITextField) {
    }
    
    @IBAction func passwordTFChanged(_ sender: UITextField) {
    }
    
    @IBAction func confPassTFChanged(_ sender: UITextField) {
    }
}
