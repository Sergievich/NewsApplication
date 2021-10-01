//
//  SignInVC.swift
//  MyNewsApp
//
//  Created by Artiom on 7.09.21.
//

import UIKit
import SwiftyJSON

class SignInVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var userErrorLbl: UILabel!
    
    private let jsonUsersUrl = "http://localhost:3000/user"

    private var users: [User] = []
    var localUser = User(email: "sdgebr", id: 0, name: "sdvwebv", groupsId: [0], password: "sdvwv")
    
  //  var localUser = UserWithoutDec(email: "sdgwev", id: 1, name: "sdvwrbv", groupsId: [0], password: "qwfqevwev")

    
    private var emailValidate = false
    private var passwordValidate = false
    
    override func viewDidLoad() {
        getUser()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    
    // MARK: - Navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "123" else { return }
        guard let destination = segue.destination as? FeedTVC else { return }
        destination.user = localUser
    }


    
    @IBAction func signInTapped() {
        
       
        guard let email = emailTF.text,
              let pass = passTF.text else { return }
        for user in users {
            if user.email == email &&  user.password == pass {
                localUser = user
                
                
                
                goToMain()
            }
 
        }

        
        
        
     //   if checkUser(email: email, pass: pass) {
            print("go to next VC")
        }
    func goToMain(){
        performSegue(withIdentifier: "123", sender: self)
    }
    
//
//    private func checkUser(email: String, pass: String) -> Bool {
//
//        let emailSaved = UserDefaults.standard.object(forKey: Constants.email) as! String
//        let passSaved = UserDefaults.standard.object(forKey: Constants.pass) as! String
//        let userFound = (email == emailSaved) && (pass == passSaved)
//        userErrorLbl.isHidden = userFound
//        return userFound
//    }
//}
    



func getUser() {

    guard let url = URL(string: jsonUsersUrl) else { return }

    let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
        guard let data = data else { return }
        print(data)
        do {
            self.users = try JSONDecoder().decode([User].self, from: data)
            print(self.users)
        } catch let error {
            print(error)
        }
    }
    task.resume()
   }

}

