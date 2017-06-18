//
//  NewItemViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/10/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    //TODO: switch to remoteDataService for real use
    private let dataService = LocalDataService()
    
    public var account = ""
    
    private let dateFormatter = DateFormatter()
    
    @IBOutlet var TitleTextField: UITextField!
    
    @IBOutlet var DescTextField: UITextField!
    
    @IBAction func AddBtnPressed(_ sender: UIButton) {
        if (TitleTextField.text != nil && DescTextField.text != nil){
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            let dateString = dateFormatter.string(from: Date())
            let titleString = TitleTextField.text!
            let detailsString = DescTextField.text!
            let item = Item(id: "\(Date().timeIntervalSince1970)", date: dateString, title: titleString, details: detailsString)
            if (dataService.newItemByAccount(account: account, item: item)){
                performSegue(withIdentifier: "seque_gobacktotable", sender: nil)
            }
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
