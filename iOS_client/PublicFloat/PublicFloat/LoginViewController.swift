//
//  LoginViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/25.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import UIKit
import AFNetworking
import OHHTTPStubs
import ObjectMapper
import RxCocoa
import RxSwift



class LoginViewController : UIViewController,UITextFieldDelegate {
    
  var current_user:User?
    var user:User?
    
    @IBOutlet var email: UITextField!
    
    var current_email = ""
    
    @IBAction func LoginButtonPress(sender: UIButton) {
        self.login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postUser(){
        let manager = AFHTTPRequestOperationManager()
        var user_params = ["user":["user_email":self.email.text]]
        manager.POST( "http://localhost:3000/users/#new",
            parameters: user_params,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }
    
    func login(){
        current_email=self.email.text
        if (emailValidate(current_email)==true){
            user = AppDelegate.current_user
            user?.user_email = current_email
            self.performSegueWithIdentifier("userLoginSegue", sender: self)
            println(user)
            println("useremal::::\(user!.user_email)")
            postUser()
            
        }else{
            showAlert()
        }
    }
    
    func emailValidate(emailtext:String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z]+@[A-Za-z0-9]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(emailtext)
    }
    
    
    //transfer information to next pages
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "userLoginSegue"
        {
            let viewController = segue.destinationViewController as! UINavigationController
            
            let tableVC = viewController.viewControllers.first as! EmotionViewController
            current_user = self.user
        }
    }
    
    func showAlert()
    {
        let alertController = UIAlertController(title: "Login Failed", message: nil, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
    //the function to control keyboard
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        email.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
}