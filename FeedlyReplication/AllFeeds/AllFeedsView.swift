//
//  AllFeedsView.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 23.09.2021.
//

import UIKit
import PinLayout

class AllFeedsView: UIView {
    let mainTable = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(mainTable)
        mainTable.separatorStyle = .none
        mainTable.allowsSelection = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainTable.pin.all(pin.safeArea)
    }
}
