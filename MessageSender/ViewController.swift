//
//  ViewController.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var textFieldsContainerView: TextFieldContainerView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    let tapSignUpRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        self.configureViews()
        //Update color of status bar on light!
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    /* Metoda konfigurująca views */
    func configureViews(){
        tapSignUpRecognizer.addTarget(self, action: "tappedSignUpView")
        signUpView.addGestureRecognizer(tapSignUpRecognizer)
        loginButton.layer.borderColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0).CGColor
        loginButton.layer.borderWidth = 1.0
        loginButton.backgroundColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
        
    }
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        if passwordTextField.text.utf16Count == 0{
            presentLoginAlert("Type password", message: "Login field can't be empty")
            return
        }
        if loginTextField.text.utf16Count == 0{
            presentLoginAlert("Type login", message: "Password field can't be empty!")
            return
        }
        else{
            let regex = NSRegularExpression(pattern: ".*[^a-z0-9].*", options: nil, error: nil)
            if regex?.firstMatchInString(loginTextField.text, options: nil, range: NSMakeRange(0, loginTextField.text.utf16Count)) != nil{
                presentLoginAlert("Wrong login", message: "Login can contain only a-z and 0-9")
                return
            }
        }
        let request = APIHelper.getProtocolVersionUrl()
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let task = session.downloadTaskWithRequest(request, completionHandler: { (localfileUrl:NSURL!, urlResponse:NSURLResponse!, error:NSError!) -> Void in
            if error != nil{
                println("error")
                //TODO: Handle error
            }
            else{
                let json = JS
                
            }
        })
        task.resume()
    }
    
    func presentLoginAlert(title:String, message:String){
        let loginAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        loginAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(loginAlert, animated: true, completion: nil)
    }

    func tappedSignUpView(){
        let tapAlert = UIAlertController(title: "Error", message: "Sorry, this is not available", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }


}

