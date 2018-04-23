//
//  userTypeSelectionViewController.swift
//  Designated Driver
//
//  Created by Brandt,Jesse R on 4/17/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import UIKit
import Parse

class userTypeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func driverButton(_ sender: UIButton) {
        UserModel.instance.fetchRiders()
        self.performSegue(withIdentifier: "driverSegue", sender: nil)
        
    }
    
    @IBAction func riderButton(_ sender: UIButton) {
        
    }
    @IBAction func logoutButton(_ sender: Any) {
        PFUser.logOutInBackground()
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}
    

}
