//
//  RegistrationVC.swift
//  MyNewsApp
//
//  Created by Artiom on 28.09.21.
//

import UIKit

import UIKit
import SwiftUI

class RegistrationVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!

    @IBOutlet weak var nameTF: UITextField!

    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passErrorLbl: UILabel!

    @IBOutlet var verifPassView: [UIView]!

    @IBOutlet weak var confPassTF: UITextField!
    @IBOutlet weak var confPassErrorLbl: UILabel!

    @IBOutlet weak var signUpBtn: UIButton!

    @IBOutlet weak var scrollView: UIScrollView!

    private var isValidEmail = false
    private var isConfPass = false
    private var passwordStrength: PasswordStrength = .veryWeak
    
    private let jsonUsersUrl = "http://localhost:3000/user"
    
    var email = ""
    var password = ""
    var name = ""
    let groups:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.startKeyboardObserver()
        
    }
    

    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let email = emailTF.text,
//            let name = nameTF.text,
//            let pass = passTF.text,
//            let destVC = segue.destination as? CodeVerifVC else { return }
//
//        destVC.email = email
//        destVC.name = name
//        destVC.pass = pass
//    }

    @IBAction func signInButtonTouch() {
        email = emailTF.text!
        password = passTF.text!
        name = nameTF.text!
        postNewUser()
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func emailTFChanged(_ sender: UITextField) {
        
        
        guard let email = sender.text else { return }
        isValidEmail = VerificationService.isValidEmail(email: email)
        emailErrorLbl.isHidden = isValidEmail

        updateBtnState()
    }

    @IBAction func passTFChanged(_ sender: UITextField) {

        // chack pass by strength
        guard let pass1 = sender.text else { return }
        passwordStrength = VerificationService.isValidPassword(pass: pass1)
        print(passwordStrength)
//        passErrorLbl.isHidden = !(passwordStrength == .veryWeak)
        verifPassView.enumerated().forEach { (index, view) in
            if (index <= (passwordStrength.rawValue - 1)) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }

        // chack confPass
        guard let pass2 = confPassTF.text else { return }
        updatePassErrorLbl(pass1: pass1, pass2: pass2)

        // updateBtn
        updateBtnState()
    }
  
    @IBAction func confPassTFChanged(_ sender: UITextField) {
        
            guard let pass1 = passTF.text,
                let pass2 = sender.text else { return }

            updatePassErrorLbl(pass1: pass1, pass2: pass2)

            updateBtnState()
        
    }
    


    @IBAction func signUpTouch(_ sender: UIButton) {
//        performSegue(withIdentifier: "showCodeVerVC", sender: nil)
        navigationController?.popToRootViewController(animated: true)
    }

    private func updatePassErrorLbl(pass1: String, pass2: String) {
        isConfPass = VerificationService.isPassCofirm(pass1: pass1, pass2: pass2)
        confPassErrorLbl.isHidden = isConfPass
    }

    private func updateBtnState() {
        signUpBtn.isEnabled = isValidEmail &&
            isConfPass && (passwordStrength != .veryWeak)
    }
    
    private func startKeyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationVC.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationVC.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func postNewUser(){
        guard let url = URL(string: jsonUsersUrl) else { return }
        let parameters = ["email": email, "password" : password, "name" : name ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, _, Error in
            guard let data = data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print (json)
                } catch {
                    print(error)
                }
            } .resume()
        }
    }
    




