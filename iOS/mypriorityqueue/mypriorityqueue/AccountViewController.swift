//
//  AccountViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/10/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let keychain = KeychainSwift()
    private let dataService = LocalDataService()
    
    private let keyChainAccountKey = "MyPriorityQueueAccount"
    
    public var loggedIn = false
    
    private var account : String? = nil
    
    @IBOutlet var UsernameLabel: UILabel!
    
    @IBOutlet var SignOutLoginBtn: UIButton!
    
    @IBAction func SignOutLoginBtnPressed(_ sender: UIButton) {
        if (loggedIn){
            signOut()
        } else {
            performSegue(withIdentifier: "seque_loginNeeded", sender: nil)
        }
    }

    public func updateAccount(val : String?){
        account = val
        let secondNavController = self.tabBarController?.viewControllers?[1] as! UINavigationController
        let secondTabController = secondNavController.viewControllers[0] as! MyQueueTableViewController
        if (account != nil){
            secondTabController.updateAccount(val: val!)
        } else {
            secondTabController.updateAccount(val: "")
        }
    }

    private func loginSuccess(account: String) {
        UsernameLabel.text = account
        UsernameLabel.isHidden = false
        SignOutLoginBtn.setTitle("Sign Out", for: UIControlState.normal)
        SignOutLoginBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
    }
    
    private func signOut() {
        if (loggedIn){
            if (!dataService.logoutAccount(account: account!)){
                print("sign out failure")
            }
        }
        loggedIn = false
        updateAccount(val: nil)
        UsernameLabel.isHidden = true
        SignOutLoginBtn.setTitle("Login", for: UIControlState.normal)
        SignOutLoginBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        performSegue(withIdentifier: "seque_loginNeeded", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        //Check if account is already logged in
        //TODO add token retrival and status checking
        let tempAccount = keychain.get(keyChainAccountKey) as String?
        if (tempAccount != nil){
            updateAccount(val: tempAccount)
            loggedIn = true
            loginSuccess(account: account!)
        } else {
            signOut()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (account != nil){
            loginSuccess(account: account!)
        }
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
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        print("unwound back to account screen")
    }
 

}
