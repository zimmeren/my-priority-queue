//
//  DataInterface.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/11/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import Foundation

class Item {
    var id: String = ""
    var date: String = ""
    var title: String = ""
    var details: String = ""
    
    init(id: String, date: String, title: String, details: String){
        self.id = id;
        self.date = date;
        self.title = title;
        self.details = details;
    }
}

protocol DataInterface {
    //create account and if successful save Token to Keychain
    func createAccount(account: String, withPassword: String) -> Bool
    //login to account and if successful save Token to Keychain
    func loginAccount(account: String, withPassword: String) -> Bool
    //logout Account and if successful delete Token from Keychain
    func logoutAccount(account: String) -> Bool
    //returns all items for an account. Does not require authentication
    func getItemsByAccount(account: String) -> [Item]?
    //Updates all items in the array. Does Require authentication
    func updateItemsByAccount(account: String, items: [Item]) -> Bool
    //Creates a new item in the array. Does Require authentication
    func newItemByAccount(account: String, item: Item) -> Bool
    //Removes a item in the array. Does Require authentication
    func removeItemByAccountAndID(account: String, index: Int) -> Bool
}
