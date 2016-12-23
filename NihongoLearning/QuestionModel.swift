//
//  AnswerModel.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/14.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation



enum AnswerOption:String{
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
}


class QuestionBuild{
    private var _questionDescription:String!
    private var _answerA:String!
    private var _answerB:String!
    private var _answerC:String!
    private var _answerD:String!
    private var _correctAnswer: AnswerOption?
    
    private var _questionKey: String!
    
    
    
    
    var questionDescription:String{
        get{
            return _questionDescription
        }set{
            _questionDescription = newValue
        }
    }
    var answerA:String{
        get{
            return _answerA
        }set{
            _answerA = newValue
        }}
    var answerB:String{
        get{
            return _answerB
        }set{
            _answerC = newValue
        }}
    
    var answerC:String{get{
        return _answerC
        }set{
            _answerC = newValue
        }}
    
    var answerD:String{get{
        return _answerD
        }set{
            _answerD = newValue
        }}
    
    var correctAnswer: AnswerOption {get{
        
        return _correctAnswer!
        }set{
            _correctAnswer = newValue
        }}
    
    
    var questionKey:String{
        return _questionKey
    }
    
    
    
    
    
    init(questionDescription:String ,answerA:String, answerB:String, answerC:String, answerD:String, correctAnswer: AnswerOption?) {
        _questionDescription = questionDescription
        _answerA = answerA
        _answerB = answerB
        _answerC = answerC
        _answerD = answerD
        _correctAnswer = correctAnswer
    }
    
    init(questionKey: String, questionData: Dictionary<String, AnyObject>){
        if let questionDescription = questionData["questionDescription"] as? String{
            self._questionDescription = questionDescription
        }
        if let answerA = questionData["answerA"] as? String{
            self._answerA = answerA
        }
        if let answerA = questionData["answerA"] as? String{
            self._answerA = answerA
        }
        if let answerB = questionData["answerB"] as? String{
            self._answerB = answerB
        }
        if let answerC = questionData["answerC"] as? String{
            self._answerC = answerC
        }
        if let answerD = questionData["answerD"] as? String{
            self._answerD = answerD
        }
        if let correctAnswer = questionData["correctAnswer"] as? String{
            self._correctAnswer = AnswerOption(rawValue: correctAnswer)
        }
        
    }
    
    
    
    
}
