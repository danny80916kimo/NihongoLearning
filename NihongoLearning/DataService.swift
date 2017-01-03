//
//  DataService.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/20.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation
import Firebase


let DB_BASE = FIRDatabase.database().reference()

class DataService{
    
    
    static let ds = DataService()
    
    fileprivate var _REF_BASE = DB_BASE
    fileprivate var _REF_QUESTIONS = DB_BASE.child("questions")
    
    var REF_BASE: FIRDatabaseReference{
        return _REF_BASE
    }
    var REF_QUESTION: FIRDatabaseReference{
        return _REF_QUESTIONS
    }
    
        
    
    
    
    
    
    
    
    
    
}
