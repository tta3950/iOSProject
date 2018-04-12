//
//  SignupViewController.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 4/12/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    var segue:UIStoryboardSegue?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var isDriver: UISwitch!
    @IBOutlet weak var carMake: UITextField!
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var optBut1: UIButton!
    @IBOutlet weak var optBut2: UIButton!
    @IBOutlet weak var optBut3: UIButton!
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
    @IBAction func onSliderChanged(_ sender: Any) {
        if  (isDriver.isOn){
            optBut1.isHidden = false
            optBut2.isHidden = false
            optBut3.isHidden = false
        }else {
            optBut1.isHidden = true
            optBut2.isHidden = true
            optBut3.isHidden = true
        }
    }
    @IBAction func phoneNumberFormatter(_ sender: Any) {
        
    }
    
}
