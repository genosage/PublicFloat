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

class LoginViewController : UIViewController,UITextFieldDelegate {

    @IBOutlet var email: UITextField!
    
    var current_email = ""
    
    @IBAction func LoginButtonPress(_ sender: UIButton) {
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
        
        let param = ["user" : ["user_email":email.text!] ]
        
        manager.POST( "https://still-scrubland-2068.herokuapp.com/users.json",
            parameters: param,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("JSON: " + responseObject.description)
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                
        })
    }
    
    func login(){
        current_email=self.email.text!
        if (emailValidate(current_email)==true){
            
            self.performSegue(withIdentifier: "userLoginSegue", sender: self)
            
            postUser()
            
        }else{
            showAlert()
        }
    }
    
    func emailValidate(_ emailtext:String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z]+@[A-Za-z0-9]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailtext)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "userLoginSegue"
        {
            let viewController = segue.destination as! UINavigationController
            
            let tableVC = viewController.viewControllers.first as! EmotionViewController
            
            tableVC.current_email = self.current_email
        }
        if segue.identifier == "Skip" {
            let viewController = segue.destination as! UINavigationController
            
            let tableVC = viewController.viewControllers.first as! EmotionViewController
            
            tableVC.current_email = ""
        }
    }
    
    
    func showAlert()
    {
        let alertController = UIAlertController(title: "Login Failed", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //the function to control keyboard
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        email.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
}
