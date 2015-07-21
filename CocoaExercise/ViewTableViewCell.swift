//
//  ViewTableViewCell.swift
//  CocoaExercise
//
//  Created by iOS on 7/21/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContentSnippet: UILabel!
    @IBOutlet weak var lblNew: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.font = UIFont(name: "HelveticaNeue-Regular", size: 17.0)
        lblTitle.textColor = UIColor.blackColor()
        lblContentSnippet.textColor = UIColor.blackColor()
    }
}
