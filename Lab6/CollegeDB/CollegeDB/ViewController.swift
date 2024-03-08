//
//  ViewController.swift
//  CollegeDB
//
//  Created by Vanessa Dubouzet on 2024-03-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var program: UITextField!
    @IBOutlet weak var grade: UITextField!
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func control(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            saveStudentRecord()
        case 1:
            findStudentRecord()
        case 2:
            updateStudentRecord()
        case 3:
            deleteStudentRecord()
        default:
            status.text = "Error"
        }
    }
    
    func saveStudentRecord() {
        let okcollegeDB = FMDatabase(path: databasePath as String)
        if (okcollegeDB.open()){
            let insertSQL = "INSERT INTO STUDENTS (name, id, program, grade) VALUES ('\(name.text!)', '\(id.text!)', '\(program.text!)', '\(grade.text!)')"
            let result = okcollegeDB.executeUpdate(insertSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to add record"
                print("Error: \(okcollegeDB.lastErrorMessage())")
            } else {
                status.text = "Record Added"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
        } else {
            print("Error: \(okcollegeDB.lastErrorMessage())")
        }
    }
    
    func findStudentRecord() {
        let okcollegeDB = FMDatabase(path: databasePath as String)
        if (okcollegeDB.open()) {
            let querySQL = "SELECT name, program, grade FROM STUDENTS WHERE id = '\(id.text!)'"
            let results:FMResultSet? = okcollegeDB.executeQuery(querySQL, withArgumentsIn: [])
            if results?.next() == true {
                name.text = results?.string(forColumn: "name")
                program.text = results?.string(forColumn: "program")
                grade.text = results?.string(forColumn: "grade")
                status.text = "Record found"
            } else {
                status.text = "Record not found"
                name.text = ""
                program.text = ""
                grade.text = ""
            }
            okcollegeDB.close()
        } else {
            print("Error: \(okcollegeDB.lastErrorMessage())")
        }
    }
    
    func updateStudentRecord() {
        let okcollegeDB = FMDatabase(path: databasePath as String)
        if (okcollegeDB.open()) {
            let updateSQL = "UPDATE STUDENTS set name = '\(name.text!)', program = '\(program.text!)', grade = '\(grade.text!)' WHERE id = '\(id.text!)'"
            let result = okcollegeDB.executeUpdate(updateSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to update record"
                print("Error: \(okcollegeDB.lastErrorMessage())")
            } else {
                status.text = "Record Updated"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
            okcollegeDB.close()
        } else {
            print("Error: \(okcollegeDB.lastErrorMessage())")
        }    }
    
    func deleteStudentRecord() {
        let okcollegeDB = FMDatabase(path: databasePath as String)
        if (okcollegeDB.open()) {
            let deleteSQL = "DELETE FROM STUDENTS WHERE id = '\(id.text!)'"
            let result = okcollegeDB.executeUpdate(deleteSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to delete record"
                print("Error: \(okcollegeDB.lastErrorMessage())")
            } else {
                status.text = "Record deleted"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
            okcollegeDB.close()
        } else {
            print("Error: \(okcollegeDB.lastErrorMessage())")
        }
    }
    
    var databasePath = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathComponent("okcollege.db").path

        if !filemgr.fileExists(atPath: databasePath as String) {
  
            let okcollegeDB = FMDatabase(path: databasePath as String)

            if (okcollegeDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS (NAME TEXT, ID TEXT PRIMARY KEY, PROGRAM TEXT, GRADE TEXT)"
                
                if !(okcollegeDB.executeStatements(sql_stmt)) {
                    print("Error creating table: \(okcollegeDB.lastErrorMessage())")
                } else {
                    print("Table created successfully")
                }
                okcollegeDB.close()
            } else {
                print("Error opening database: \(okcollegeDB.lastErrorMessage())")
            }
        } else {
            let okcollegeDB = FMDatabase(path: databasePath)
            if okcollegeDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS (NAME TEXT, ID TEXT PRIMARY KEY, PROGRAM TEXT, GRADE TEXT)"
                if !okcollegeDB.executeStatements(sql_stmt) {
                    print("Error creating table: \(okcollegeDB.lastErrorMessage())")
                }
                okcollegeDB.close()
            } else {
                print("Error opening existing database: \(okcollegeDB.lastErrorMessage())")
            }
        }
    }

}

