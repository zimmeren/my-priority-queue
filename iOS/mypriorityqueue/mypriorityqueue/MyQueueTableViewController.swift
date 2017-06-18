//
//  MyQueueTableViewController.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/11/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class MyQueueTableViewController: UITableViewController {

    //TODO: switch to remoteDataService for real use
    private let dataService = LocalDataService()
    
    private var tableData : [Item]? = nil
    
    private var account = ""
    
    private var orderEnabled = false
    
    public func updateAccount(val: String){
        account = val
        updateData()
        self.tableView.reloadData()
    }
    
    @IBOutlet var OrderItemBtn: UIBarButtonItem!
    
    @IBAction func OrderItemBtnPressed(_ sender: UIBarButtonItem) {
        if (orderEnabled){
            OrderItemBtn.title = "Order"
            tableView.setEditing(false, animated: true);
            orderEnabled = false
        } else {
            OrderItemBtn.title = "Set"
            tableView.setEditing(true, animated: true);
            orderEnabled = true
        }
    }
    
    @IBOutlet var NewItemBtn: UIBarButtonItem!
    
    @IBOutlet var LabelFooter: UILabel!
    
    private func updateData() {
        tableData = dataService.getItemsByAccount(account: account)
    }
    
    private func checkIfEmpty() {
    if (tableData != nil && tableData!.count > 0){
            LabelFooter.isHidden = true
        } else {
            LabelFooter.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
        checkIfEmpty()
        if (account != ""){
            NewItemBtn.isEnabled = true
        } else {
            NewItemBtn.isEnabled = false
        }
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (!dataService.updateItemsByAccount(account: account, items: tableData!)){
            print("Failed to save my priority queue on view will dissapear")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyQueueItemCell", for: indexPath) as! MyQueueTableViewCell
        if (tableData != nil){
            let data = tableData![indexPath.row]
            cell.updateCell(data: data)
        }
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableData?.remove(at: indexPath.row)
            if (tableData!.count <= 0){
                checkIfEmpty()
                tableView.deleteSections([indexPath.section], with: .fade)
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = tableData?[fromIndexPath.row]
        tableData?.remove(at: fromIndexPath.row)
        tableData?.insert(item!, at: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "seque_createnewitem" {
            if let destination = segue.destination as? NewItemViewController {
                destination.account = account
            }
        }
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        print("unwound back to my queue table")
    }

}
