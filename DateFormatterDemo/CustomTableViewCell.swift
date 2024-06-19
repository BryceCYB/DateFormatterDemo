//
//  CustomTableViewCell.swift
//  DateFormatterDemo
//
//  Created by Bryce Chan on 19/6/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var dateLabel : UILabel = {
        let label = UILabel()
        label.text = "Date: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var formatLabel : UILabel = {
        let label = UILabel()
        label.text = "Format: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeZoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Time Zone: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var localeLabel : UILabel = {
        let label = UILabel()
        label.text = "Locale: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupSubViews() {
        addSubview(dateLabel)
        addSubview(formatLabel)
        addSubview(timeZoneLabel)
        addSubview(localeLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            formatLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            formatLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2),
            formatLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            timeZoneLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            timeZoneLabel.topAnchor.constraint(equalTo: formatLabel.bottomAnchor, constant: 2),
            timeZoneLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            localeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            localeLabel.topAnchor.constraint(equalTo: timeZoneLabel.bottomAnchor, constant: 2),
            localeLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            localeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ])
    }
}
