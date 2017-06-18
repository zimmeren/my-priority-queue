//
//  ViewControllerExtensions.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/17/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

//extend UIViewController to close keyboard on touch outside or return button
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
