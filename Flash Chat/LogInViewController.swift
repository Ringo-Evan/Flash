//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login



import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        if let email = emailTextfield.text
        {
            if let pass = passwordTextfield.text
            {
                SVProgressHUD.show()
                
                //TODO: Log in the user
                Auth.auth().signIn(withEmail: email, password: pass){(user, Error)
                in
                    if Error != nil
                    {
                        SVProgressHUD.dismiss()
                        print("shit did not worked")
                        let alert = UIAlertController(title: "You fucked up", message: Error?.localizedDescription, preferredStyle: .alert)
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
        else{
            let alert = UIAlertController(title: "You fucked up", message: "Put a fucking email and pass in idiot", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Woops", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    


    
}  
