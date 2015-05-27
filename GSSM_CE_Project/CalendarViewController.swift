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
    @IBOutlet var numberFields:[UITextField]!
    var model:Thingy!
    
    func makeModel(passedModel:Thingy) {
        model = passedModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("****************** HEY LOOK AT ME!!! **********" + model!.getUsername())
        // Do any additional setup after loading the view.
        let filepath = self.dataFilePath()// + "/"+model!.getUsername()
        if(NSFileManager.defaultManager().fileExistsAtPath(filepath)){
           let array = NSArray(contentsOfFile: filepath) as! [String]
            for var i = 0; i < array.count; i++ {
                numberFields[i].text = array[i]
            }
        }
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: app)
    }
    
    func applicationWillResignActive(notification:NSNotification){
        let filePath = self.dataFilePath()// + "/"+model!.getUsername()
        let array = (self.numberFields as NSArray).valueForKey("text") as! NSArray
        array.writeToFile(filePath, atomically:true)
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
            let filePath = self.dataFilePath()// + "/"+model!.getUsername()
            let array = (self.numberFields as NSArray).valueForKey("text") as! NSArray
            array.writeToFile(filePath, atomically:true)
        }
    }
    
    func dataFilePath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = paths[0] as! NSString
        let name = model!.getUsername()
        return documentsDirectory.stringByAppendingPathComponent(name + "data.plist") as String
    }

}
