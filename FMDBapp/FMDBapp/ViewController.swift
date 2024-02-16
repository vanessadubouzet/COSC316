//
//  ViewController.swift
//  FMDBapp
//
//  Created by Vanessa Dubouzet on 2024-02-15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func saveRecord(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB.open()){
            
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('\(name.text!)', '\(address.text!)', '\(phone.text!)')"
            
            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
            
            if !result {
                status.text = "Failed to add contact"
                print("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact Added"
                name.text = ""
                address.text = ""
                phone.text = ""
            }
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func findRecord(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB.open()) {
            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name ='\(name.text!)'"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsIn: [])
            
            if results?.next() == true {
                address.text = results?.string(forColumn: "address")
                phone.text = results?.string(forColumn: "phone")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                address.text = ""
                phone.text = ""
            }
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    @IBAction func updateRecord(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB.open()) {
            let updateSQL = "UPDATE CONTACTS set address ='\(address.text!)', phone ='\(phone.text!)' WHERE name = '\(name.text!)'"
            
            let result = contactDB.executeUpdate(updateSQL, withArgumentsIn: [])
            
            if !result {
                status.text = "Failed to update contact"
                print("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact Updated"
                name.text = ""
                address.text = ""
                phone.text = ""
            }
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    @IBAction func deleteRecord(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB.open()) {
            let deleteSQL = "DELETE FROM CONTACTS WHERE name = '\(name.text!)'"
            
            let result = contactDB.executeUpdate(deleteSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to delete contact"
                print("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact deleted"
                name.text = ""
                address.text = ""
                phone.text = ""
            }
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    var databasePath = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathComponent("contacts.db").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            let contactDB = FMDatabase(path: databasePath as String)
            if (contactDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !(contactDB.executeStatements(sql_stmt)) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }
}

