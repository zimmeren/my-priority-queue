//
//  LocalDataService.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/11/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import Foundation

class Account {
    var email: String = ""
    var password: String = ""
    var token: String = ""
    
    init(email: String, password: String, token: String){
        self.email = email
        self.password = password
        self.token = token
    }
}

class LocalDataService : DataInterface {
    private let keychain = KeychainSwift()
    private let keyChainAccountKey = "MyPriorityQueueAccount"
    
    //Mocked out server data for local demoing and testing without a server
    static var accounts:[String : Account] = [
        "tester1@email.com": Account(email: "tester1@email.com", password: "Pass", token: "1111"),
        "tester2@email.com": Account(email: "tester2@email.com", password: "Pass", token: "2222"),
        "tester3@email.com": Account(email: "tester3@email.com", password: "Pass", token: "3333")
    ]
    static var data:[String: [Item] ] = [
        "tester1@email.com" :
        [
            Item(id: "0", date: "2017-01-04 15:25:37 +0000", title: "My Task 0", details: "tester1@email.com - Here are my Details for Task 0"),
            Item(id: "1", date: "2017-01-04 15:25:37 +0000", title: "My Task 1", details: "tester1@email.com - Here are my Details for Task 1"),
            Item(id: "2", date: "2017-01-04 15:25:37 +0000", title: "My Task 2", details: "tester1@email.com - Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2"),
            Item(id: "3", date: "2017-01-04 15:25:37 +0000", title: "My Task 3", details: "tester1@email.com - Here are my Details for Task 3"),
            Item(id: "4", date: "2017-01-04 15:25:37 +0000", title: "My Task 4", details: "tester1@email.com - Here are my Details for Task 4"),
            Item(id: "5", date: "2017-01-04 15:25:37 +0000", title: "My Task 5", details: "tester1@email.com - Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5"),
            Item(id: "6", date: "2017-01-04 15:25:37 +0000", title: "My Task 6", details: "tester1@email.com - Here are my Details for Task 6"),
            Item(id: "7", date: "2017-01-04 15:25:37 +0000", title: "My Task 7", details: "tester1@email.com - Here are my Details for Task 7"),
        ],
        "tester2@email.com" :
        [
            Item(id: "0", date: "2017-01-04 15:25:37 +0000", title: "My Task 0", details: "tester2@email.com - Here are my Details for Task 0"),
            Item(id: "1", date: "2017-01-04 15:25:37 +0000", title: "My Task 1", details: "tester2@email.com - Here are my Details for Task 1"),
            Item(id: "2", date: "2017-01-04 15:25:37 +0000", title: "My Task 2", details: "tester2@email.com - Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2"),
            Item(id: "3", date: "2017-01-04 15:25:37 +0000", title: "My Task 3", details: "tester2@email.com - Here are my Details for Task 3"),
            Item(id: "4", date: "2017-01-04 15:25:37 +0000", title: "My Task 4", details: "tester2@email.com - Here are my Details for Task 4"),
            Item(id: "5", date: "2017-01-04 15:25:37 +0000", title: "My Task 5", details: "tester2@email.com - Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5"),
            Item(id: "6", date: "2017-01-04 15:25:37 +0000", title: "My Task 6", details: "tester2@email.com - Here are my Details for Task 6"),
            Item(id: "7", date: "2017-01-04 15:25:37 +0000", title: "My Task 7", details: "tester2@email.com - Here are my Details for Task 7"),
        ],
        "tester3@email.com" :
        [
            Item(id: "0", date: "2017-01-04 15:25:37 +0000", title: "My Task 0", details: "tester3@email.com - Here are my Details for Task 0"),
            Item(id: "1", date: "2017-01-04 15:25:37 +0000", title: "My Task 1", details: "tester3@email.com - Here are my Details for Task 1"),
            Item(id: "2", date: "2017-01-04 15:25:37 +0000", title: "My Task 2", details: "tester3@email.com - Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2 Here are my Details for Task 2"),
            Item(id: "3", date: "2017-01-04 15:25:37 +0000", title: "My Task 3", details: "tester3@email.com - Here are my Details for Task 3"),
            Item(id: "4", date: "2017-01-04 15:25:37 +0000", title: "My Task 4", details: "tester3@email.com - Here are my Details for Task 4"),
            Item(id: "5", date: "2017-01-04 15:25:37 +0000", title: "My Task 5", details: "tester3@email.com - Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5 Here are my Details for Task 5"),
            Item(id: "6", date: "2017-01-04 15:25:37 +0000", title: "My Task 6", details: "tester3@email.com - Here are my Details for Task 6"),
            Item(id: "7", date: "2017-01-04 15:25:37 +0000", title: "My Task 7", details: "tester3@email.com - Here are my Details for Task 7"),
        ]
    ]
    
    //create account and if successful save Token to Keychain
    func createAccount(account: String, withPassword: String) -> Bool{
        if ((LocalDataService.accounts[account]) == nil){
            LocalDataService.accounts[account] = Account(email: account, password: withPassword, token: "1111")
            if(keychain.set(account, forKey: keyChainAccountKey)){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    //login to account and if successful save Token to Keychain
    func loginAccount(account: String, withPassword: String) -> Bool{
        if ((LocalDataService.accounts[account]) != nil && LocalDataService.accounts[account]?.password == withPassword){
            if(keychain.set(account, forKey: keyChainAccountKey)){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    //logout Account and if successful delete Token from Keychain
    func logoutAccount(account: String) -> Bool{
        if (keychain.delete(keyChainAccountKey)){
            return true
        } else {
            return false
        }
    }
    //returns all items for an account. Does not require authentication
    func getItemsByAccount(account: String) -> [Item]?{
        return LocalDataService.data[account]
    }
    //Updates all items in the array. Does Require authentication
    func updateItemsByAccount(account: String, items: [Item]) -> Bool{
        LocalDataService.data[account] = []
        for item in items {
            LocalDataService.data[account]! += [item]
        }
        return true
    }
    //Creates a new item in the array. Does Require authentication
    func newItemByAccount(account: String, item: Item) -> Bool{
        LocalDataService.data[account]! += [item]
        return true
    }
    //Removes a item in the array. Does Require authentication
    func removeItemByAccountAndID(account: String, index: Int) -> Bool{
        if(LocalDataService.data[account]?[index] != nil){
            LocalDataService.data[account]?.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
