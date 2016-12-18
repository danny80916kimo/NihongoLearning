//
//  ResultVC.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/17.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    
    @IBOutlet weak var resultTableView: UITableView!
    
    
    private var _finalResults: Array<Result>!
    
    var finalResults: Array<Result>?{
        get{
            return _finalResults
        }set{
            _finalResults = newValue
        }
    }
    
    

    


    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        if let string1 = finalResults{
      print("成功了","\(string1)")
        
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
        // Get the new view controller using segue.destinationVas iewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ResultVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as? ResultTableViewCell{
            let result = finalResults?[indexPath.row]
            cell.updateUI(results: result!)
            print("tableView成功")
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
}
