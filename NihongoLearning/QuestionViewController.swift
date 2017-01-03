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
    
    
    var answeredAQuestion = AnsweredStatus()
    
    var numberOfQuestions: Int = 10
    
    
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    
    
    
    
    
    
    
    func makeQuestion(_ questionNumber: QuestionBuild){
        
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
            let answer = answers[indexPath.section]
            cell.updateUI(answer)
            
            answerTableView.backgroundColor = UIColor.clear
            
            answerTableView.layer.shadowColor = UIColor.darkGray.cgColor
            
            answerTableView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            
            answerTableView.layer.shadowOpacity = 0.6
            
            answerTableView.layer.shadowRadius = 2
            
            
            
            
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 5
            cell.layer.borderColor = UIColor.orange.cgColor
            
            
            
            
            
            
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        var blankOptions: Int
        blankOptions = 0
        for answer in answers{
            if answer.answerDescription == ""{
                blankOptions += 1
            }
            
        }
        
        return (4 - blankOptions)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
        
        
        //        self.answerTableView.reloadData()
        
        
        answeredAQuestion.answeredOneQuestion()
        
        for i in 1...numberOfQuestions{
            switch answeredAQuestion.numberOfQuestionAnswered {
                
            case i:
                if 1...(numberOfQuestions - 1) ~= i{
                    print("第\(i)題答完")
                    
                    makeQuestion(FirebaseQ[i]!)
                    self.animateTable()
                   
                    
                   
                    
                    let answer = answers[indexPath.section]
                    
                    
                    if answer.answerOption == FirebaseQ[i - 1]?.correctAnswer {
                        print("第\(i)題答對了")
                        let qresult = Result(correct: true)
                        result.append(qresult)
                    }else{
                        print("第\(i)題答錯了")
                        let qresult = Result(correct: false)
                        result.append(qresult)
                    }
                }
                
                
                
                if i == numberOfQuestions{
                    performSegue(withIdentifier: "QuestionViewController", sender: result)
                    result.removeAll()
                    answeredAQuestion.replay()
                    FirebaseQ.removeAll()
                    answers.removeAll()
                    
                }
            default:
                break
                
            }
        }
        
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerTableView.separatorStyle = .none
        
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
                    self.makeQuestion(FirebaseWorking)
                }
                self.questionDescriptionLabel.text = self.FirebaseQ[0]?.questionDescription
                
                self.answerTableView.delegate = self
                self.answerTableView.dataSource = self
                print("load of ringGGGGGGGGG")
                self.animateTable()
                
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
    func animateTable() {
        answerTableView.reloadData()
        
        let cells = answerTableView.visibleCells
        let tableHeight: CGFloat = answerTableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for c in cells {
            let cell: UITableViewCell = c as UITableViewCell
            UIView.animate(withDuration: 1, delay: 0.1 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }

    
}
