//
//  TabBarViewController.swift
//  GSSM_CE_Project
//
//  Created by jbingham15 on 5/26/15.
//  Copyright (c) 2015 Bingham&Sylvester. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    weak var model:Thingy!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("******** Made it to the tab bar" + model.getUsername())
        //(self.viewControllers[0] as! CalendarViewController).model = self.model
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print("******* I'm about to die :D")
//        var view:UIViewController = segue.destinationViewController as! UIViewController
//        (view as! CalendarViewController).model = self.model
//    }
    

}
