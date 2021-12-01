//
//  Person.swift
//  userDefaulf
//
//  Created by zed on 9/17/21.
//

import Foundation

class Person:Codable {
    var fristName: String
    var lastName: String
    var gender: String
    var phoneNum: String
    var password: String
    init() {
        fristName = ""
        lastName = ""
        gender = ""
        phoneNum = ""
        password = ""
    }
    
}
