//
//  YourQueueViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/10/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class YourQueueViewController: UIViewController {

    
    @IBOutlet var SearchTextField: UITextField!
    
    @IBAction func SearchBtnPressed(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround() 
        super.viewDidLoad()

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
        if segue.identifier == "seque_toYourQueue" {
            if let destination = segue.destination as? YourQueueTableViewController {
                if (SearchTextField.text != nil){
                    destination.account = SearchTextField.text!
                } else {
                    destination.account = ""
                }
            }
        }
    }
 

}
