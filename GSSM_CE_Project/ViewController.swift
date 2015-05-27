//
//  ViewController.swift
//  GSSM_CE_Project
//
//  Created by jbingham15 on 3/16/15.
//  Copyright (c) 2015 Bingham&Sylvester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var model:Thingy! = Thingy()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.tabBar.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPress(sender: UIButton) {
        if(model!.checkUsername(usernameBox.text)){
            if(model!.checkPassword(passwordBox.text)){
                self.performSegueWithIdentifier("Load View", sender: loginButton)
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Load View") {
            // pass data to next view
            model!.storeUsername(usernameBox.text)
            (segue.destinationViewController as! TabBarViewController).model = self.model
            var tabControl = (segue.destinationViewController as! TabBarViewController)
            var otherView:CalendarViewController = tabControl.viewControllers?[0] as! CalendarViewController
            otherView.model = self.model
        }
    }
    
    @IBAction func usernameEdited(sender: UITextField) {
        textFieldDidBeginEditing(sender)
    }
    
    @IBAction func usernameFinished(sender: UITextField) {
        textFieldDidEndEditing(sender)
    }
    
    @IBAction func passwordEdited(sender: UITextField) {
        textFieldDidBeginEditing(sender)
    }
    
    @IBAction func passwordFinished(sender: UITextField) {
        textFieldDidEndEditing(sender)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue: 100)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 100)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }


}

