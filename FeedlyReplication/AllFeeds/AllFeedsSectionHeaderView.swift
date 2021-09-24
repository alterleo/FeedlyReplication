//
//  AllFeedsSectionHeaderView.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 24.09.2021.
//

import UIKit
import PinLayout

class AllFeedsSectionHeaderView: UITableViewHeaderFooterView {
    static let sectionHeaderId = "allFeedsSectionHeaderId"
    
    let headerLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUi() {
        contentView.backgroundColor = .white
        contentView.addSubview(headerLabel)
        headerLabel.textColor = .feedTitle
        headerLabel.font = UIFont(name: "Arial-BoldMT", size: 16)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        headerLabel.pin.bottom().left(20).right().sizeToFit()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        return CGSize(width: contentView.frame.width, height: 50)
    }
    
    func configure(text: String) {
        headerLabel.text = text
    }
}
