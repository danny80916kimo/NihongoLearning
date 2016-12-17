//
//  ResultVC.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/17.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    
    
    
    private var _finalResult: Result!
    
    var finalResult: Result?{
        get{
            return _finalResult
        }set{
            _finalResult = newValue
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let string1 = finalResult?.correct{
      print("\(string1)")
        
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
