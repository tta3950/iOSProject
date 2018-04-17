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
        let temp:String = String(text[text.index(before: text.endIndex)])
        password.text = replaceWithStars(text)
        tempPasswordStr += temp
    }
    func replaceWithStars(_ str:String) -> String{
        var temp:String = ""
        for _ in str {
            temp+="*"
        }
        return temp
    }
    
    
    @IBAction func singUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = emailAddress.text
        user.password = password.text
        user.email = emailAddress.text
        
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                //in case something went wrong, as errstring to get the error
            } else {
                // everthing went okay
            }
        }
    }
}

