//
//  YourQueueTableViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/11/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class YourQueueTableViewController: UITableViewController {
    
    //TODO: switch to remoteDataService for real use
    private let dataService = LocalDataService()
    
    private var tableData : [Item]? = nil
    
    public var account = ""
    
    @IBOutlet var NavBarUsername: UINavigationItem!
    
    @IBOutlet var LabelFooter: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        NavBarUsername.title = account
        tableData = dataService.getItemsByAccount(account: account)
        if (tableData != nil && tableData!.count > 0){
            LabelFooter.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if (tableData != nil && tableData!.count > 0){
            return 1
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableData != nil){
            return tableData!.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourQueueItemCell", for: indexPath) as! YourQueueTableViewCell
        if (tableData != nil){
            let data = tableData![indexPath.row]
            cell.updateCell(data: data)
        }
        return cell
    }

}
