//
//  QUESTIONS.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/13.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation




class ANSWERS{
    
    
    private var _answerDescription:String!
    private var _answerOption:AnswerOption!
    
    var answerDescription:String{
        return _answerDescription
    }
    var answerOption:AnswerOption{
        return _answerOption
    }
    
    init(answerDescription:String , answerOption: AnswerOption){
        _answerDescription = answerDescription
        _answerOption = answerOption
    }
    
    
       
        
    
    
    
}
