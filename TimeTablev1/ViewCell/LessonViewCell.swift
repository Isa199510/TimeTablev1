//
//  LessonViewCell.swift
//  TimeTablev1
//
//  Created by Иса on 24.11.2022.
//

import UIKit

class LessonViewCell: UITableViewCell {
    
    @IBOutlet var nameLessonLabel: UILabel!
    
    func configure(nameLesson: String) {
        nameLessonLabel.text = nameLesson
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
