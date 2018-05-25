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
    
    private var pageCounter: Int = 1
    
    private var indexPathsForSelectedRows: [IndexPath] = [] {
        didSet {
            numberOfSelections = String(indexPathsForSelectedRows.count)
        }
    }
    private var numberOfSelections: String = "Number of selections 0" {
        didSet {
          title =  "Number of selections \(numberOfSelections)"
        }
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        title = numberOfSelections
        setupTableView()
        fetchNewsData()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.register(NewsInfoTableViewCell.self)
    }
    
    // MARK: - Data
    private func fetchNewsData() {
        DataManager.instance.fentchNewsPosts(page: pageCounter) { [weak self] news in
            guard let unwSelf = self else { return }
            unwSelf.newsItems.append(contentsOf: news)
            if !news.isEmpty {
               unwSelf.pageCounter += 1
            }
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
        let isSelectedRow = indexPathsForSelectedRows.contains(indexPath)
        cell.setupCell(title: newsItem.title, createTime: newsItem.createdAt.toString(), isSelected: isSelectedRow)
        
        if indexPath.row == newsItems.count - 3 {
            fetchNewsData()
        }
        
       return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        for (index, selectedIndexPath) in indexPathsForSelectedRows.enumerated() where selectedIndexPath == indexPath {
            indexPathsForSelectedRows.remove(at: index)
            tableView.deselectRow(at: indexPath, animated: false)
            tableView.reloadRows(at: [indexPath], with: .none)
            return nil
        }
        indexPathsForSelectedRows.append(indexPath)
        tableView.reloadRows(at: [indexPath], with: .none)
        return nil
    }
}
