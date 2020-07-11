//
//  TableViewCell.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var issueNumberlbl: UILabel!
    @IBOutlet weak var issueCreatorNamelbl: UILabel!
    @IBOutlet weak var issueCreatedDatelbl: UILabel!
    @IBOutlet weak var issueTitlelbl: UILabel!
    @IBOutlet weak var bannerView: UIView! {
        didSet {
            bannerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            bannerView.layer.shadowOpacity = 0.5
            bannerView.layer.shadowRadius = 3.0
            bannerView.layer.shadowColor = UIColor.lightGray.cgColor
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

    static func cellIdentifier() -> String  {
        return "TableViewCell"
    }

    func cellConfiguration(model: Issues) {
        self.issueNumberlbl.text = model.number?.toString()
        self.issueCreatorNamelbl.text = model.user?.login ?? ""
        self.issueCreatedDatelbl.text = model.created_at ?? ""//?.toString(formate: "yyyy/MM/dd")
        self.issueTitlelbl.text = model.title ?? ""
    }
}


