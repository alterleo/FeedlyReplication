//
//  AllFeedsCell.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 23.09.2021.
//

import UIKit
import PinLayout

class AllFeedsCell: UITableViewCell {
    static let cellId = "allFeedsCell"
    
    private let mainText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainText)
        mainText.numberOfLines = 0
        mainText.lineBreakMode = .byTruncatingTail
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(feed: Feed) {
        let string1 = NSAttributedString(string: feed.title, attributes: [
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor.feedText
        ])
        
        let string2 = NSAttributedString(string: " / " + feed.source + " / " + feed.time, attributes: [
            NSAttributedString.Key.font : UIFont(name: "ArialMT", size: 14)!,
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ])
        
        let text = NSMutableAttributedString()
        text.append(string1)
        text.append(string2)
        
        mainText.attributedText = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        mainText.pin.top(10).bottom(10).left(20).right(20).sizeToFit(.width)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        return CGSize(width: contentView.frame.width, height: mainText.frame.maxY + 10)
    }
}
