//
//  AllFeedsViewController.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 22.09.2021.
//

import UIKit

protocol AllFeedsViewControllerProtocol: AnyObject {
    func reloadData()
}

class AllFeedsViewController: UIViewController {
    
    private lazy var presenter = AllFeedsPresenter(view: self)
    let mainView = AllFeedsView()
    
    public override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        updateData()
        super.viewWillAppear(animated)
    }
    
    private func updateData() {
        presenter.reloadData()
    }
    
    func setupUi() {
        navigationItem.title = "All Personal Feeds"
        mainView.mainTable.delegate = self
        mainView.mainTable.dataSource = self
        mainView.mainTable.register(AllFeedsCell.self, forCellReuseIdentifier: AllFeedsCell.cellId)
//        mainView.mainTable.rowHeight = UITableView.automaticDimension
//        mainView.mainTable.estimatedRowHeight = 100
    }


}

// MARK: AllFeedsViewControllerProtocol
extension AllFeedsViewController: AllFeedsViewControllerProtocol {
    func reloadData() {
        print(#function)
        mainView.mainTable.reloadData()
    }
}


extension AllFeedsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.allFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllFeedsCell.cellId, for: indexPath) as! AllFeedsCell
//        let cell = UITableViewCell()
//        cell.textLabel?.numberOfLines = 0
        cell.configure(feed: presenter.allFeeds[indexPath.row])
//        let feed = presenter.allFeeds[indexPath.row]
//        let string1 = NSAttributedString(string: feed.title, attributes: [
//            NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 15)!,
//            NSAttributedString.Key.foregroundColor: UIColor.black
//        ])
//
//        let string2 = NSAttributedString(string: " / " + feed.source + " / " + feed.time, attributes: [
//            NSAttributedString.Key.font : UIFont(name: "ArialMT", size: 13)!,
//            NSAttributedString.Key.foregroundColor: UIColor.gray
//        ])
//
//        let text = NSMutableAttributedString()
//        text.append(string1)
//        text.append(string2)
//        cell.textLabel?.attributedText = text
//        feed.title + " / " + feed.source + " / " + feed.time
        return cell
    }
    
    
}
