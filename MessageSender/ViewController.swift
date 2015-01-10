//
//  ViewController.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var textFieldsContainerView: TextFieldContainerView!
    @IBOutlet weak var signUpView: UIView!
    let tapSignUpRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        
        
        
    }
    
    func configureViews(){
        tapSignUpRecognizer.addTarget(self, action: "tappedSignUpView")
        signUpView.addGestureRecognizer(tapSignUpRecognizer)
        loginButton.layer.borderColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0).CGColor
        loginButton.layer.borderWidth = 1.0
        loginButton.backgroundColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
        
    }

    func tappedSignUpView(){
        let tapAlert = UIAlertController(title: "Error", message: "Sorry, this is not available", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }


}

