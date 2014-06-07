//
//  TrainCell.swift
//  RunningTrain
//
//  Created by Elliott Kipper on 6/6/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import UIKit

class TrainCell: UITableViewCell {

    @IBOutlet var trainNameLabel : UILabel
    @IBOutlet var timeLabel : UILabel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithTrain(train:Train)
    {
        trainNameLabel.text = train.name;
        switch train.status
        {
            case .OnTime:
                self.timeLabel.text = ""
            case .Early(let earlyBy):
                self.timeLabel.text = "Early by \(earlyBy) minutes"
            case .Late(let lateBy):
                self.timeLabel.text = "Late by \(lateBy) minutes"
        }
    }
    
}
