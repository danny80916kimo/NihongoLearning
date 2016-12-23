//
//  AnsweredStatus.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/14.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation

class AnsweredStatus{
    
    var numberOfQuestionAnswered = 0
    
    
    func answeredOneQuestion(){
        
        numberOfQuestionAnswered += 1
        
        print("第\(numberOfQuestionAnswered)題答完了")
    }
    func replay(){
        
        numberOfQuestionAnswered = 0
        print("重新開始")
        
        
        
    }

    
}
