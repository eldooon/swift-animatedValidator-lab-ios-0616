//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    var validEmail = false
    var validConfirmEmail = false
    var validPhone = false
    var validPassword = false
    var validConfirmPassword = false
    
    var submitButtonYConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        
        emailTextField.delegate = self
        emailConfirmationTextField.delegate = self
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
        
        //auto-layout
        //removing constraints
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.removeConstraints(self.view.constraints)
        
        self.submitButton.translatesAutoresizingMaskIntoConstraints = false
        self.submitButton.removeConstraints(self.view.constraints)
        
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.removeConstraints(self.view.constraints)
        
        self.emailConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailConfirmationTextField.removeConstraints(self.view.constraints)
        
        self.phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        self.phoneTextField.removeConstraints(self.view.constraints)
        
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.removeConstraints(self.view.constraints)
        
        self.passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordConfirmTextField.removeConstraints(self.view.constraints)
        
        //new constraints
        self.submitButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.submitButtonYConstraint = self.submitButton.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor , constant: 200)
        submitButtonYConstraint.active = true
        
        self.emailTextField.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.emailTextField.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -200).active = true
        self.emailTextField.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -50).active = true
        
        self.emailConfirmationTextField.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.emailConfirmationTextField.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -160).active = true
        self.emailConfirmationTextField.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -50).active = true
        
        self.phoneTextField.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.phoneTextField.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -120).active = true
        self.phoneTextField.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -50).active = true
        
        
        self.passwordTextField.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.passwordTextField.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -80).active = true
        self.passwordTextField.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -50).active = true
        
        
        self.passwordConfirmTextField.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.passwordConfirmTextField.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -40).active = true
        self.passwordConfirmTextField.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -50).active = true
        
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        switch textField {
        case emailTextField:
            if emailTextField.text?.rangeOfString("@") != nil  && emailTextField.text?.rangeOfString(".") != nil {
                validEmail = true
                valid()
            }
                
            else {
                validEmail = false
                invalid(emailTextField)
                self.submitButton.enabled = false
            }
            
        case emailConfirmationTextField:
            if emailConfirmationTextField.text == emailTextField.text {
                validConfirmEmail = true
                valid()
            }
            else {
                validConfirmEmail = false
                invalid(emailConfirmationTextField)
                self.submitButton.enabled = false
            }
        case phoneTextField:
            let numberSet = NSCharacterSet(charactersInString: "1234567890").invertedSet
            if phoneTextField.text?.characters.count >= 7 && phoneTextField.text?.rangeOfCharacterFromSet(numberSet) == nil {
                validPhone = true
                valid()
            }
            else {
                validPhone = false
                invalid(phoneTextField)
                self.submitButton.enabled = false
            }
        case passwordTextField:
            if passwordTextField.text?.characters.count >= 6 {
                validPassword = true
                valid()
            }
            else {
                validPassword = false
                invalid(passwordTextField)
                self.submitButton.enabled = false
            }
        case passwordConfirmTextField:
            if passwordConfirmTextField.text == passwordTextField.text {
                validConfirmPassword = true
                valid()
            }
            else {
                validConfirmPassword = false
                invalid(passwordConfirmTextField)
                self.submitButton.enabled = false
            }
        default:
            print ("nothing here")
        }
    }
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        
//    }
//    
    func valid() {
        
        if validEmail && validConfirmEmail && validPhone && validPassword && validConfirmPassword {
            
            UIView.animateWithDuration(1.0, animations: {
                self.submitButtonYConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
            self.submitButton.enabled = true
        }
        
    }
    
    func invalid (textfield : UITextField) {
        
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: [.Autoreverse], animations: {
            textfield.backgroundColor = UIColor.redColor()
            textfield.transform = CGAffineTransformMakeScale(0.95, 0.95)
            self.view.layoutIfNeeded()
            
        }) { (completed) in
            textfield.backgroundColor = UIColor.whiteColor()
            textfield.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.view.layoutIfNeeded()
        }
        
        UIView.animateWithDuration(1.0, animations: {
            self.submitButtonYConstraint.constant = 200
            self.view.layoutIfNeeded()
        })
        
    }
    
   
}

