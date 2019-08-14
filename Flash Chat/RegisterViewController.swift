//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        

        
        if let email = emailTextfield.text
        {
            if let pass = passwordTextfield.text
            {
                SVProgressHUD.show()
                //TODO: Set up a new user on our Firbase database
                Auth.auth().createUser(withEmail: email, password: pass){( user, error)
                in
                    if error != nil{
                        SVProgressHUD.dismiss()
                        print("shit did not worked")
                        let alert = UIAlertController(title: "You fucked up", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Woops", style: .default))
                        self.present(alert, animated: true, completion: nil)
                    }
                    else{
                        SVProgressHUD.dismiss()
                        print("shit worked")
                        self.performSegue(withIdentifier:"goToChat", sender: self)
                    }
                
                }
            }
        
        }
        else
        {
            let alert = UIAlertController(title: "You fucked up", message: "Put a fucking email and pass in idiot", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Woops", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

        
        
    } 
    
    
}
