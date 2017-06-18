//
//  AccountLogInViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/10/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class AccountLogInViewController: UIViewController {
    
    //TODO: switch to remoteDataService for real use
    private let dataService = LocalDataService()
    
    private var account = ""

    @IBOutlet weak var ErrorTextLabel: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        if (EmailTextField.text != nil && PasswordTextField.text != nil){
            if (dataService.loginAccount(account: EmailTextField.text!, withPassword: PasswordTextField.text!)){
                account = EmailTextField.text!
                performSegue(withIdentifier: "seque_unwindtoaccount", sender: nil)
            } else {
                ErrorTextLabel.isHidden = false
                ErrorTextLabel.text = "Login Failed"
            }
        } else {
            ErrorTextLabel.isHidden = false
            ErrorTextLabel.text = "Invalid Values"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        ErrorTextLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "seque_unwindtoaccount" {
            if let destination = segue.destination as? AccountViewController {
                destination.updateAccount(val: account)
                destination.loggedIn = true
            }
        }
    }
}
