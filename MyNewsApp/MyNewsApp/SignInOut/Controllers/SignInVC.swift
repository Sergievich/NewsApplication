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
    
   

    var localUser = User(email: "sdgebr", id: 0, name: "sdvwebv", groupsId: [0], password: "sdvwv")
    
    
    override func viewDidLoad() {
        ParsinhgServices.getUsers()
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
        for user in ParsinhgServices.allUsers {
            if user.email == email &&  user.password == pass {
                localUser = user
                performSegue(withIdentifier: "123", sender: self)
                print("Плная модель юзера \(user)")
            }
        }
           // print("go to next VC")
        }

    


}

