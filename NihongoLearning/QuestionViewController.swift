//
//  QuestionViewController.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/13.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    var answeredAQuestion = AnsweredStatus()

    
    
    let q1 = QuestionBuild(questionDescription: "下列哪一種自然環境是台灣能夠產出最多樣的水果，具有成為水果王國的條件？", answerA: "以平原為主的溫帶地區", answerB: "有高山地形的溫帶地區", answerC: "以平原為主的熱帶地區", answerD: "有高山地形的熱帶地區", correctAnswer: .D )
    let q2 = QuestionBuild(questionDescription: "第二題題目", answerA: " Q2選項A", answerB: "Q2選項B", answerC: "Q2選項C", answerD: "Q2選項D" , correctAnswer: .A)
    
   
    
    

    
    
    
    
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    var answers = [ANSWERS]()
    
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCellID", for: indexPath) as? QuestionTableViewCell{
            let answer = answers[indexPath.row]
            cell.updateUI(answers: answer)
            questionDescriptionLabel.text = q1.questionDescription
            return cell
        }else{
            return UITableViewCell()
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let answer = answers[indexPath.row]
        if answer.answerOption == q1.correctAnswer{
            print("答對了")
        }else{
                print("答錯了")
            }
        
        
        answeredAQuestion.answeredOneQuestion()
        

        if answeredAQuestion.numberOfQuestionAnswered == 1{
            tableView.reloadData()
          
        }
        
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
        
        let ans1StringA = q1.answerA
        let ans1StringB = q1.answerB
        let ans1StringC = q1.answerC
        let ans1StringD = q1.answerD
        let ans1CorrectAns = q1.correctAnswer
        print("RyanDebug:" + ans1StringA)
        
        let ansA = ANSWERS(answerDescription: ans1StringA, answerOption: .A)
        let ansB = ANSWERS(answerDescription: ans1StringB, answerOption: .B)
        let ansC = ANSWERS(answerDescription: ans1StringC, answerOption: .C)
        let ansD = ANSWERS(answerDescription: ans1StringD, answerOption: .D)
        let ansCorrect = ANSWERS(answerDescription: "", answerOption: ans1CorrectAns)
        
        
        
        print("RyanDebug:\(ansA.answerDescription)")
        
        answers.append(ansA)
        answers.append(ansB)
        answers.append(ansC)
        answers.append(ansD)
        answers.append(ansCorrect)
        
        print("RyanDebug:\(answers)")
        
        
        
        
        


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
