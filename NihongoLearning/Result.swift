//
//  Result.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/17.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import Foundation


class Result{
    var correct: Bool{
        return _correct
    }
    
    fileprivate var _correct:Bool
    init(correct:Bool){
        _correct = correct
    }
    
}
