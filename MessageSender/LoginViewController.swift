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
    var activitySpinner: UIActivityIndicatorView!
    
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
        activitySpinner = UIActivityIndicatorView(frame: CGRectMake(0, 0, 100, 100))
        activitySpinner.center = self.view.center
        activitySpinner.hidesWhenStopped = true
        activitySpinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(activitySpinner)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        loginButtonTapped(self)
        return true
        
    }
    
    /*  */
    @IBAction func loginButtonTapped(sender: AnyObject) {
        // If any of text fields is first responder right now - resign of it.
        if self.loginTextField.isFirstResponder(){
            self.loginTextField.resignFirstResponder()
        }
        if self.passwordTextField.isFirstResponder(){
            self.passwordTextField.resignFirstResponder()
        }
        
        
        //Section that check, if textField
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
        let request = APIHelper.getProtocolVersionUrlRequest()
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        self.activitySpinner.startAnimating()
        let task = session.downloadTaskWithRequest(request, completionHandler: { (localfileUrl:NSURL!, urlResponse:NSURLResponse!, error:NSError!) -> Void in
            if error != nil{
                println("error")
                //TODO: Handle error
            }
            else{
                let json = JSON(data:NSData(contentsOfURL: localfileUrl)!)
                if let protocolVersion = json[APIKeys.protocolVersionKey].int{
                    println("Protocol Version: \(protocolVersion)")
                }
                else{
                    println("nie udalo sie!")
                }
            }
            dispatch_async(dispatch_get_main_queue()){
                self.activitySpinner.stopAnimating()
                let messagesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("navigation") as UINavigationController
                let delegate = UIApplication.sharedApplication().delegate as AppDelegate!
                let window = delegate.window!
                window.rootViewController = messagesViewController
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
        self.loginButton.titleLabel?.text = "SIGNUP"
        var newRect = self.signUpView.frame
        UIView.animateWithDuration(4.0, animations: { () -> Void in
            newRect.origin.y = 200
            self.signUpView.frame = newRect
        })
        
    }


}

