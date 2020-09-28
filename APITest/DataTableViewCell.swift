//
//  DataTableViewCell.swift
//  APITest
//
//  Created by Sukidhar Darisi on 28/9/20.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    var titleLabel :UILabel {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.font = UIFont(name: "Helvetica-Bold", size: 20)
        tl.textColor = .black
        tl.numberOfLines = 0
        return tl
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addTitleLabel()
        self.accessoryType = .disclosureIndicator
    }
    
    func addTitleLabel(){
        self.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15).isActive = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
