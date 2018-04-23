//
//  SignupViewController.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 4/12/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    var segue:UIStoryboardSegue?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!

    var tempPasswordStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showPassword(_ sender: Any) {
        password.text=tempPasswordStr
    }
    @IBAction func unShowPassword(_ sender: Any) {
        password.text = replaceWithStars(password.text!)
    }
    @IBAction func inputChanged(_ sender: Any) {
        let text = password.text!
        //check if text field is empty
        if(text.count != 0){
            //get the last key entered by user (* is == backspace)
            let temp:String = String(text[text.index(before: text.endIndex)])
            //obfuscate the current field
            password.text = replaceWithStars(text)
            if(temp != "*"){
                //add the corresponding character to password string and continue
                tempPasswordStr += temp
            }else{
                //remove last character from password
                if(tempPasswordStr.count != 0 && tempPasswordStr.count > 1){
                    tempPasswordStr.removeLast()
                }else{
                    tempPasswordStr.removeAll()
                }
            }
        }else{
            //the user hit backspace at passwordField.text.count = 0 or 1, don't add anything and remove last character
            //if applicable
            tempPasswordStr.removeAll()
        }
    }
    func replaceWithStars(_ str:String) -> String{
        var temp:String = ""
        for _ in str {
            temp+="*"
        }
        return temp
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        if(validateInput()){
            UserModel.instance.signUpAsUser(firstName.text!,lastName.text!,emailAddress.text!, password.text!)
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    func validateInput() -> Bool{
        //here be arrow code
        //try not to replicate code like this, it is bad looking and I feel bad for making it
        if(firstName.text?.count == 0){
            loginAlert(message: "First name field is blank" as String, title: "Incomplete field")
            return false
        }else{
            if(lastName.text?.count == 0){
                loginAlert(message: "Last name field is blank" as String, title: "Incomplete field")
                return false
            }else{
                if(emailAddress.text?.count == 0){
                    if(!(emailAddress.text?.contains("@"))!){
                        loginAlert(message: "Email Address is not valid" as String, title: "Incomplete field")
                        return false
                    }else{
                        if(password.text?.count == 0){
                            loginAlert(message: "Password field is blank" as String, title: "Incomplete field")
                            return false
                        }
                    }
                    loginAlert(message: "Email address field is blank" as String, title: "Incomplete field")

                    return false
                }
            }
        }
        return true
    }
    func loginAlert(message: String, title: NSString){
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

