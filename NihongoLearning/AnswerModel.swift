//
//  AnswerModel.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/14.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation



enum AnswerOption:String{
    case A
    case B
    case C
    case D
}


class QuestionBuild{
    private var _questionDescription:String!
    private var _answerA:String!
    private var _answerB:String!
    private var _answerC:String!
    private var _answerD:String!
    private var _correctAnswer: AnswerOption?
    
    
    var questionDescription:String{
        return _questionDescription
    }
    var answerA:String{
        return _answerA
    }
    var answerB:String{
        return _answerB
    }
    var answerC:String{
        return _answerC
    }
    var answerD:String{
        return _answerD
    }
    var correctAnswer: AnswerOption{
        return _correctAnswer!
    }
    
    
    
    
    
    init(questionDescription:String ,answerA:String, answerB:String, answerC:String, answerD:String, correctAnswer: AnswerOption?) {
        _questionDescription = questionDescription
        _answerA = answerA
        _answerB = answerB
        _answerC = answerC
        _answerD = answerD
        _correctAnswer = correctAnswer
    }
    
    
    
    
    
    
}
