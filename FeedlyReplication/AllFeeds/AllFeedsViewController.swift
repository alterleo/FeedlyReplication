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
        mainView.mainTable.register(AllFeedsSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: AllFeedsSectionHeaderView.sectionHeaderId)
    }
    
    
}

// MARK: AllFeedsViewControllerProtocol
extension AllFeedsViewController: AllFeedsViewControllerProtocol {
    func reloadData() {
        print(#function)
        mainView.mainTable.reloadData()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension AllFeedsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.allFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllFeedsCell.cellId, for: indexPath) as! AllFeedsCell
        cell.configure(feed: presenter.allFeeds[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: AllFeedsSectionHeaderView.sectionHeaderId) as? AllFeedsSectionHeaderView else { return UIView() }
                
        view.configure(text: "Today")
        
        return view
    }
    
}
