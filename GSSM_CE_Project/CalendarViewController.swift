//
//  CalendarViewController.swift
//  GSSM_CE_Project
//
//  Created by jbingham15 on 5/23/15.
//  Copyright (c) 2015 Bingham&Sylvester. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPress(sender: UIButton) {
        self.performSegueWithIdentifier("Logout", sender: logoutButton)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Logout") {
            // pass data to next view
        }
    }

}
