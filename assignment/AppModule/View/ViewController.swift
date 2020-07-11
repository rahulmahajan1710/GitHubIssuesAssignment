//
//  ViewController.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            self.tableView.register(UINib(nibName: TableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: TableViewCell.cellIdentifier())
        }
    }

    var viewModel: ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        getIssuesList(state: .open, page: 1, per_page: 10)
    }

    func getIssuesList(state: State, page: Int, per_page: Int) {
        if viewModel == nil {
            viewModel = ViewModel()
        }
        viewModel?.state = state
        viewModel?.page = page
        viewModel?.per_page = per_page
        viewModel?.getIssueList(isCompleted: { [weak self] (response, message) in
            DispatchQueue.main.async {
                if response {
                    self?.tableView.reloadData()
                    return
                }
                self?.showToast(withMessage: message)
            }
        })
    }
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.tableView.scrollsToTop = true
            getIssuesList(state: .open, page: 1, per_page: 10)
        }
        else {
            self.tableView.scrollsToTop = true
            getIssuesList(state: .closed, page: 1, per_page: 10)

        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.issuesData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier(), for: indexPath) as! TableViewCell
        guard let issueModel = self.viewModel?.issuesData[indexPath.row] else { return cell }
        cell.cellConfiguration(model: issueModel)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let issueModel =  self.viewModel?.issuesData[indexPath.row]
        let body = issueModel?.body
        if let vc = Generic.getViewControllerFromStoryBoard(type: DetailViewController.self, storyBoard: .MAIN) {
            vc.body = body ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

            let tableHeight = tableView.bounds.size.height
            let contentHeight = tableView.contentSize.height
            let insetHeight = tableView.contentInset.bottom

            let yOffset = tableView.contentOffset.y
            let yOffsetAtBottom = yOffset + tableHeight - insetHeight
            if (yOffsetAtBottom >= contentHeight)
            {
                self.viewModel?.page = (self.viewModel?.page ?? 0) + 1
                let state: State = self.viewModel?.state ?? .open
                let page = self.viewModel?.page ?? 1
                let per_page = self.viewModel?.per_page ?? 10 
                self.getIssuesList(state: state, page: page, per_page: per_page)
            }
        }
}

