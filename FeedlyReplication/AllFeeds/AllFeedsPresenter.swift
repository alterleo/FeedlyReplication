//
//  AllFeedsPresenter.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 23.09.2021.
//

import Foundation

class AllFeedsPresenter {
    unowned var view: AllFeedsViewControllerProtocol
    var allFeeds = [Feed]()
    
    init(view: AllFeedsViewControllerProtocol) {
        self.view = view
    }
    
    func reloadData() {
        allFeeds = Feed.getMock()
        view.reloadData()
    }
}
