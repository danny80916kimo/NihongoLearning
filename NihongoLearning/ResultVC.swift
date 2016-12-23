//
//  ResultVC.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/17.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    

    @IBAction func playAgainPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        self.parent?.loadView()
    }
    
    @IBAction func backToMainPressed(_ sender: Any) {
        
        
        self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: {})
        
        
        
    }
    @IBOutlet weak var resultTableView: UITableView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var _finalResults: Array<Result>!
    
    var finalResults: Array<Result>?{
        get{
            return _finalResults
        }set{
            _finalResults = newValue
        }
    }
    
    var score:Double = 0.0
    
    

    


    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        if let string1 = finalResults{
      print("成功了","\(string1)")
        
        }
        
        for result in finalResults!{
            if result.correct{
                score += 10
            }
            
            
        }
        print(score)
        scoreLabel.text = "\(score)分"


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
            
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (finalResults?.count)!
    }
    
    
}
