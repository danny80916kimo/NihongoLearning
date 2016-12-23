//
//  ResultTableViewCell.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/17.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var resultCellLabel: UILabel!
    
    
    func updateUI(results: Result){
        if results.correct {
        resultCellLabel.text = "O"
        }else{
            resultCellLabel.text = "X"
        }
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
