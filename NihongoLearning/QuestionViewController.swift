//
//  QuestionViewController.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/13.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    var result = [Result]()
    
    
    
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    var answeredAQuestion = AnsweredStatus()
    
    
    
    let q1 = QuestionBuild(questionDescription: "下列哪一種自然環境是台灣能夠產出最多樣的水果，具有成為水果王國的條件？", answerA: "以平原為主的溫帶地區", answerB: "有高山地形的溫帶地區", answerC: "以平原為主的熱帶地區", answerD: "有高山地形的熱帶地區", correctAnswer: .D )
    let q2 = QuestionBuild(questionDescription: "第二題題目", answerA: "Q2選項A", answerB: "Q2選項B", answerC: "Q2選項C", answerD: "Q2選項D" , correctAnswer: .A)
    
    let q3 = QuestionBuild(questionDescription: "第三題題目", answerA: "Q3選項A", answerB: "Q3選項B", answerC: "Q3選項C", answerD: "Q3選項D" , correctAnswer: .A)
    
    let q4 = QuestionBuild(questionDescription: "第4題題目", answerA: "Q4選項A", answerB: "Q4選項B", answerC: "Q4選項C", answerD: "Q4選項D" , correctAnswer: .A)
    let q5 = QuestionBuild(questionDescription: "第5題題目", answerA: "Q5選項A", answerB: "Q5選項B", answerC: "Q5選項C", answerD: "Q5選項D" , correctAnswer: .A)
    let q6 = QuestionBuild(questionDescription: "第6題題目", answerA: "Q6選項A", answerB: "Q6選項B", answerC: "Q6選項C", answerD: "Q6選項D" , correctAnswer: .A)
    let q7 = QuestionBuild(questionDescription: "第7題題目", answerA: "Q7選項A", answerB: "Q7選項B", answerC: "Q7選項C", answerD: "Q7選項D" , correctAnswer: .A)
    let q8 = QuestionBuild(questionDescription: "第8題題目", answerA: "Q8選項A", answerB: "Q8選項B", answerC: "Q8選項C", answerD: "Q8選項D" , correctAnswer: .A)
    let q9 = QuestionBuild(questionDescription: "第9題題目", answerA: "Q9選項A", answerB: "Q9選項B", answerC: "Q9選項C", answerD: "Q9選項D" , correctAnswer: .A)
    let q10 = QuestionBuild(questionDescription: "第10題題目", answerA: "Q10選項A", answerB: "Q10選項B", answerC: "Q10選項C", answerD: "Q10選項D" , correctAnswer: .A)
    
    
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
        
        answers.insert(ansA , at: 0)
        answers.insert(ansB , at: 1)
        answers.insert(ansC , at: 2)
        answers.insert(ansD , at: 3)
        answers.insert(ansCorrect ,at: 4)
        
        if answeredAQuestion.numberOfQuestionAnswered >= 1{
            answers.removeSubrange(5...9)
        }
        print("RyanDebug:\(answers.description)")
        
        
        
        
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
        
        
        
        
        
        answeredAQuestion.answeredOneQuestion()
        
        
        switch answeredAQuestion.numberOfQuestionAnswered {
            
        case 1:
            print("第一題答完")
            
            makeQuestion(questionNumber: q2)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q1.correctAnswer{
                print("第1題答對了")
                let q1result = Result(correct: true)
                result.append(q1result)
            }else{
                print("第1題答錯了")
                let q1result = Result(correct: false)
                result.append(q1result)
            }

    
            
                
                
        case 2:
            print("第二題答完")
            
            makeQuestion(questionNumber: q3)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
                
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q2.correctAnswer{
                print("第2題答對了")
                let q2result = Result(correct: true)
                result.append(q2result)
            }else{
                print("第2題答錯了")
                let q2result = Result(correct: false)
                result.append(q2result)
            }

            
        case 3:
            makeQuestion(questionNumber: q4)
            
            print("第三題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q3.correctAnswer{
                print("第3題答對了")
                let q3result = Result(correct: true)
                result.append(q3result)
            }else{
                print("第3題答錯了")
                let q3result = Result(correct: false)
                result.append(q3result)
            }
        case 4:
            makeQuestion(questionNumber: q5)
        
            print("第四題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q4.correctAnswer{
                print("第4題答對了")
                let q4result = Result(correct: true)
                result.append(q4result)
            }else{
                print("第4題答錯了")
                let q4result = Result(correct: false)
                result.append(q4result)
            }
        case 5:
            makeQuestion(questionNumber: q6)
            
            print("第五題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q5.correctAnswer{
                print("第5題答對了")
                let q5result = Result(correct: true)
                result.append(q5result)
            }else{
                print("第5題答錯了")
                let q5result = Result(correct: false)
                result.append(q5result)
            }
        case 6:
            makeQuestion(questionNumber: q7)
            
            print("第六題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q6.correctAnswer{
                print("第6題答對了")
                let q6result = Result(correct: true)
                result.append(q6result)
            }else{
                print("第6題答錯了")
                let q6result = Result(correct: false)
                result.append(q6result)
            }
        case 7:
            makeQuestion(questionNumber: q8)
            
            print("第七題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q7.correctAnswer{
                print("第7題答對了")
                let q7result = Result(correct: true)
                result.append(q7result)
            }else{
                print("第7題答錯了")
                let q7result = Result(correct: false)
                result.append(q7result)
            }
        case 8:
            makeQuestion(questionNumber: q9)
            
            print("第八題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q8.correctAnswer{
                print("第8題答對了")
                let q8result = Result(correct: true)
                result.append(q8result)
            }else{
                print("第8題答錯了")
                let q8result = Result(correct: false)
                result.append(q8result)
            }
            
        case 9:
            makeQuestion(questionNumber: q10)
            
            print("第九題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q9.correctAnswer{
                print("第9題答對了")
                let q9result = Result(correct: true)
                result.append(q9result)
            }else{
                print("第9題答錯了")
                let q9result = Result(correct: false)
                result.append(q9result)
            }
            
        case 10:
            
            print("第十題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == q10.correctAnswer{
                print("第10題答對了")
                let q10result = Result(correct: true)
                result.append(q10result)
            }else{
                print("第10題答錯了")
                let q10result = Result(correct: false)
 
                result.append(q10result)
            }

            let sendingResults = result

            print("append結果：" + "\(result)")
            print("傳送結果：" + "\(sendingResults)")
            
            performSegue(withIdentifier: "QuestionViewController", sender: sendingResults)
            
            
        default:
            self.answerTableView.reloadData()
            print("還沒答題")


            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
        makeQuestion(questionNumber: q1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultVC{
            if let sendResult = sender as? Result{
            destination.finalResult = sendResult
                print("finalResult" + "\(destination.finalResult)")
            }
        }
    
    
    
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear" + "\(result)")
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     // Pass the selected object to the new view controller.
     }
     */
    
}
