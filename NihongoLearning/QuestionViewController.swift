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

    
    let q0 = QuestionBuild(questionDescription: "尚未開始答題", answerA: "000000", answerB: "000000", answerC: "000000", answerD: "000000", correctAnswer: .D )

    
    let q1 = QuestionBuild(questionDescription: "下列哪一種自然環境是台灣能夠產出最多樣的水果，具有成為水果王國的條件？", answerA: "以平原為主的溫帶地區", answerB: "有高山地形的溫帶地區", answerC: "以平原為主的熱帶地區", answerD: "有高山地形的熱帶地區", correctAnswer: .D )
    let q2 = QuestionBuild(questionDescription: "第二題題目", answerA: " Q2選項A", answerB: "Q2選項B", answerC: "Q2選項C", answerD: "Q2選項D" , correctAnswer: .A)
    
    let q3 = QuestionBuild(questionDescription: "第三題題目", answerA: " Q3選項A", answerB: "Q3選項B", answerC: "Q3選項C", answerD: "Q3選項D" , correctAnswer: .A)
    
    func makeQuestion(questionNumber: QuestionBuild){
        questionDescriptionLabel.text = questionNumber.questionDescription
        let ansStringA = questionNumber.answerA
        let ansStringB = questionNumber.answerB
        let ansStringC = questionNumber.answerC
        let ansStringD = questionNumber.answerD
        let ansCorrectAns = questionNumber.correctAnswer
        print("RyanDebug:" + ansStringA)
        
        
        //建立ans作為ANSWERS物件來寫入剛剛建立的ans1String
        
        let ansA = ANSWERS(answerDescription: ansStringA, answerOption: .A)
        let ansB = ANSWERS(answerDescription: ansStringB, answerOption: .B)
        let ansC = ANSWERS(answerDescription: ansStringC, answerOption: .C)
        let ansD = ANSWERS(answerDescription: ansStringD, answerOption: .D)
        let ansCorrect = ANSWERS(answerDescription: "", answerOption: ansCorrectAns)
        
        //把answers append到物件序列裡面好讓tableCell去讀這個序列的answerDecription
        
        print("RyanDebug:\(ansA.answerDescription)")
        
        answers.append(ansA)
        answers.append(ansB)
        answers.append(ansC)
        answers.append(ansD)
        answers.append(ansCorrect)
        
        print("RyanDebug:\(answers)")
    }
    
    
    
    
    
    
    
    
    
    
   
    
    

    
    
    
    
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    var answers = [ANSWERS]()
    
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCellID", for: indexPath) as? QuestionTableViewCell{
            let answer = answers[indexPath.row]
            cell.updateUI(answers: answer)
            
            return cell
        }else{
            return UITableViewCell()
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.answerTableView.reloadData()
        
        
        
        
        
        let answer = answers[indexPath.row]
        if answer.answerOption == q1.correctAnswer{
            print("答對了")
        }else{
                print("答錯了")
            }
        
        
        answeredAQuestion.answeredOneQuestion()
        

        switch answeredAQuestion.numberOfQuestionAnswered {
        case 0:
            
            makeQuestion(questionNumber: q0)
            self.answerTableView.reloadData()
            
        case 1:
            print("第一題答完")
    
            makeQuestion(questionNumber: q1)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
        case 2:
            print("第二題答完")
           
            makeQuestion(questionNumber: q2)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
                
            }
            
        case 3:
            makeQuestion(questionNumber: q3)
    
            print("第三題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
        default:
            self.answerTableView.reloadData()
            print("還沒答題")
            
            
        }
        
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.delegate = self
        answerTableView.dataSource = self
       
        makeQuestion(questionNumber: q0)
    
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
