//
//  QuestionTableViewCell.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/13.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var answerLabel: UILabel!
    
    
    
    func updateUI(answers: ANSWERS){
        answerLabel.text = "(\(answers.answerOption)). " + answers.answerDescription
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
