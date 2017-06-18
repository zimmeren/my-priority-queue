//
//  AccountCreationViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/10/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class AccountCreationViewController: UIViewController {

    //TODO: switch to remoteDataService for real use
    private let dataService = LocalDataService()
    
    private var account = ""
    
    @IBAction func CreateBtnPressed(_ sender: UIButton) {
        if (EmailTextField.text != nil && PasswordTextField.text != nil){
            if (dataService.createAccount(account: EmailTextField.text!, withPassword: PasswordTextField.text!)){
                account = EmailTextField.text!
                performSegue(withIdentifier: "seque_unwindtoaccount", sender: nil)
            } else {
                ErrorTextLabel.isHidden = false
                ErrorTextLabel.text = "Creation Failed"
            }
        } else {
            ErrorTextLabel.isHidden = false
            ErrorTextLabel.text = "Invalid Values"
        }
    }
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ErrorTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        ErrorTextLabel.isHidden = true
        // Do any additional setup after loading the view.
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
