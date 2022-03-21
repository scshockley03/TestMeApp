//
//  Student.swift
//  TestMeApp
//
//  Created by Stan Shockley on 3/15/22.
//

import Foundation

class Student {
    
    var email : String = ""
    var fName : String = ""
    var lName : String = ""
    var questionNumber : String = ""
    
    
    init(questionNumber : String, email : String, fName : String, lName : String) {
        
        self.questionNumber = questionNumber
        self.email = email
        self.fName = fName
        self.lName = lName
        
    }
    
}
