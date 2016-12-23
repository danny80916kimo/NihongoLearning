//
//  QuestionViewController.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/13.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit
import Firebase
class QuestionViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    var result = [Result]()
    
    var FirebaseQ = [QuestionBuild?]()
    
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    var answeredAQuestion = AnsweredStatus()
    
    
    
    var q1 = QuestionBuild(questionDescription: "下列哪一種自然環境是台灣能夠產出最多樣的水果，具有成為水果王國的條件？", answerA: "以平原為主的溫帶地區", answerB: "有高山地形的溫帶地區", answerC: "以平原為主的熱帶地區", answerD: "有高山地形的熱帶地區", correctAnswer: .D )
    var q2 = QuestionBuild(questionDescription: "第二題題目", answerA: "Q2選項A", answerB: "Q2選項B", answerC: "Q2選項C", answerD: "Q2選項D" , correctAnswer: .A)
    
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
        
        let ansA = ANSWERS(answerDescription: questionNumber.answerA, answerOption: .A)
        let ansB = ANSWERS(answerDescription: questionNumber.answerB, answerOption: .B)
        let ansC = ANSWERS(answerDescription: questionNumber.answerC, answerOption: .C)
        let ansD = ANSWERS(answerDescription: questionNumber.answerD, answerOption: .D)
    
        
        answers.insert(ansA , at: 0)
        answers.insert(ansB , at: 1)
        answers.insert(ansC , at: 2)
        answers.insert(ansD , at: 3)
        
        if answeredAQuestion.numberOfQuestionAnswered >= 1{
            answers.removeSubrange(4...7)
        }
        
        
    }
    
    
    
    @IBOutlet weak var answer: UITableView!
    
    
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
        
//        self.answerTableView.reloadData()
        
        
        answeredAQuestion.answeredOneQuestion()
        
        
        switch answeredAQuestion.numberOfQuestionAnswered {
            
        case 1:
            print("第一題答完")
            
            makeQuestion(questionNumber: FirebaseQ[1]!)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[0]?.correctAnswer {
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
            
            makeQuestion(questionNumber: FirebaseQ[2]!)
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
                
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[1]!.correctAnswer {
                print("第2題答對了")
                let q2result = Result(correct: true)
                result.append(q2result)
            }else{
                print("第2題答錯了")
                let q2result = Result(correct: false)
                result.append(q2result)
            }
            
            
        case 3:
            makeQuestion(questionNumber: FirebaseQ[3]!)
            
            print("第三題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[2]!.correctAnswer {
                print("第3題答對了")
                let q3result = Result(correct: true)
                result.append(q3result)
            }else{
                print("第3題答錯了")
                let q3result = Result(correct: false)
                result.append(q3result)
            }
        case 4:
            makeQuestion(questionNumber: FirebaseQ[4]!)
            
            print("第四題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[3]!.correctAnswer {
                print("第4題答對了")
                let q4result = Result(correct: true)
                result.append(q4result)
            }else{
                print("第4題答錯了")
                let q4result = Result(correct: false)
                result.append(q4result)
            }
        case 5:
            makeQuestion(questionNumber: FirebaseQ[5]!)
            
            print("第五題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[4]!.correctAnswer {
                print("第5題答對了")
                let q5result = Result(correct: true)
                result.append(q5result)
            }else{
                print("第5題答錯了")
                let q5result = Result(correct: false)
                result.append(q5result)
            }
        case 6:
            makeQuestion(questionNumber: FirebaseQ[6]!)
            
            print("第六題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[5]!.correctAnswer{
                print("第6題答對了")
                let q6result = Result(correct: true)
                result.append(q6result)
            }else{
                print("第6題答錯了")
                let q6result = Result(correct: false)
                result.append(q6result)
            }
        case 7:
            makeQuestion(questionNumber: FirebaseQ[7]!)
            
            print("第七題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[6]!.correctAnswer {
                print("第7題答對了")
                let q7result = Result(correct: true)
                result.append(q7result)
            }else{
                print("第7題答錯了")
                let q7result = Result(correct: false)
                result.append(q7result)
            }
        case 8:
            makeQuestion(questionNumber: FirebaseQ[8]!)
            
            print("第八題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[7]!.correctAnswer{
                print("第8題答對了")
                let q8result = Result(correct: true)
                result.append(q8result)
            }else{
                print("第8題答錯了")
                let q8result = Result(correct: false)
                result.append(q8result)
            }
            
        case 9:
            makeQuestion(questionNumber: FirebaseQ[9]!)
            
            print("第九題答完")
            DispatchQueue.main.async{
                self.answerTableView.reloadData()
            }
            let answer = answers[indexPath.row]
            if answer.answerOption == FirebaseQ[8]!.correctAnswer{
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
            if answer.answerOption == FirebaseQ[9]!.correctAnswer {
                print("第10題答對了")
                let q10result = Result(correct: true)
                result.append(q10result)
            }else{
                print("第10題答錯了")
                let q10result = Result(correct: false)
                
                result.append(q10result)
            }
            
            
            performSegue(withIdentifier: "QuestionViewController", sender: result)
            
            
        default:
            self.answerTableView.reloadData()
            print("還沒答題")
            
            
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            
        DataService.ds.REF_QUESTION.observe(.value, with: {(snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot {
                    print("SNAP\(snap)")
                    self.answerTableView.reloadData()
                    
                    if let questionDict = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                        let question = QuestionBuild(questionKey: key, questionData: questionDict)
                        self.FirebaseQ.append(question)
                        print("zack\(question.questionDescription)")
                        
                        
                    }
                }
            }
            
             print("DataServiceDEBUG:\(self.FirebaseQ[0]?.questionDescription)")
//            self.makeQuestion(questionNumber: self.FirebaseQ[0])
            
            if let FirebaseWorking = self.FirebaseQ[0]{
                self.makeQuestion(questionNumber: FirebaseWorking)
            }
            self.questionDescriptionLabel.text = self.FirebaseQ[0]?.questionDescription
            
            self.answerTableView.delegate = self
            self.answerTableView.dataSource = self
        })
        
        }
        
           }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ResultVC{
            if let sendResult = sender as? Array<Result> {
                destination.finalResults = sendResult
            }
        }
        
        
        
        
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        print("第1題答對答錯" + "\(result[0].correct)")
//        print("第2題答對答錯" + "\(result[1].correct)")
//        print("第3題答對答錯" + "\(result[2].correct)")
//        print("第4題答對答錯" + "\(result[3].correct)")
//        print("第5題答對答錯" + "\(result[4].correct)")
//        print("第6題答對答錯" + "\(result[5].correct)")
//        print("第7題答對答錯" + "\(result[6].correct)")
//        print("第8題答對答錯" + "\(result[7].correct)")
//        print("第9題答對答錯" + "\(result[8].correct)")
//        print("第10題答對答錯" + "\(result[9].correct)")
//        
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     // Pass the selected object to the new view controller.
     }
     */
    
}
