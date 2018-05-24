//
//  PostsListViewController.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import UIKit

class PostsListViewController: UIViewController {

    
    @IBOutlet private weak var tableView: UITableView!
    
    private var newsItems: [NewsInfo] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsInfoTableViewCell.self)
    }
    
    // MARK: - Data
    private func fetchNewsData() {
        DataManager.instance.fentchNewsPosts(page: 1) { [weak self] news, _ in
            guard let unwSelf = self else { return }
            unwSelf.newsItems = news
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PostsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsInfoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let newsItem = newsItems[indexPath.row]
        cell.setupCell(title: newsItem.title, createTime: newsItem.createdAt.toString())
       return cell
    }
}
