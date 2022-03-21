//
//  LoginViewController.swift
//  TestMeApp
//
//  Created by Stan Shockley on 3/17/22.
//

import UIKit
import SQLite3

class LoginViewController: UIViewController {

    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    var db : OpaquePointer?
    var stuList = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileP = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("TestMeAppDB.sqlite")
        print("Database path is ", fileP)
        
        if sqlite3_open(fileP.path, &db) != SQLITE_OK {
            print("Cannot open database")
        }

        
    }
    
    @IBAction func Login(_ sender: Any) {
        
        let userEmail = Email.text! as! NSString
        let fName = FirstName.text! as! NSString
        let lName = LastName.text! as! NSString
        var stmt : OpaquePointer?
        let query = "insert into Answers (Email, FirstName, LastName) values (?,?,?)"
        
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db)!)
            print("There is a prepare error", err)
        }
            
        if sqlite3_bind_text(stmt, 1, userEmail.utf8String, -1, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db)!)
            print("There is a bind error", err)
        }
        
        if sqlite3_bind_text(stmt, 2, fName.utf8String, -1, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db)!)
            print("There is a bind error", err)
        }
        
        if sqlite3_bind_text(stmt, 3, lName.utf8String, -1, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db)!)
            print("There is a bind error", err)
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let err = String(cString: sqlite3_errmsg(db)!)
            print("There is a step error", err)
        }
        
        print("Data has been saved")
        
    }
    
    
}
