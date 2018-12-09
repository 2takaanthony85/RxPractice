//
//  TodoTitleTableViewCell.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/09.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class TodoTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBOutlet weak var TodoTitleInput: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
