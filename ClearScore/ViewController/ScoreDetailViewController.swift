//
//  ScoreDetailViewController.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import UIKit

class ScoreDetailViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var scoreModel: ScoreModel?
    
    
    //MARK: - setUpTableView
    func setUpTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib.init(nibName: ScoreDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ScoreDetailTableViewCell.identifier)
    }
    //MARK: - Lifecycle
    convenience init(scoreModel: ScoreModel?) {
        self.init(nibName: "ScoreDetailViewController", bundle: nil)
        self.scoreModel = scoreModel
    }
    
    override init(nibName nibNameorNil: String?, bundle nibBundleorNil: Bundle?) {
        super.init(nibName: nibNameorNil, bundle: nibBundleorNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigationBar(title: "Details")
        overrideUserInterfaceStyle = .light
        self.setUpTableView()
    }
}


extension ScoreDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreDetailTableViewCell.identifier) as? ScoreDetailTableViewCell {
                
                let hasEverDefaulted = self.scoreModel?.creditReportInfo?.hasEverDefaulted == true ? "Yes" : "No"
                
                cell.decorateCell(titleOne: "Has ever Defaulted", titleTwo: hasEverDefaulted)
                return cell
            }
        }
        else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreDetailTableViewCell.identifier) as? ScoreDetailTableViewCell {
                cell.decorateCell(titleOne: "Months since last defaulted ", titleTwo: String(self.scoreModel?.creditReportInfo?.monthsSinceLastDefaulted ?? 0))
                return cell
            }
        }
        else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreDetailTableViewCell.identifier) as? ScoreDetailTableViewCell {
                cell.decorateCell(titleOne: "Current short term debt", titleTwo: String(self.scoreModel?.creditReportInfo?.currentShortTermDebt ?? 0))
                return cell
            }
        }
       else if indexPath.row == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreDetailTableViewCell.identifier) as? ScoreDetailTableViewCell {
                cell.decorateCell(titleOne: "Change in short term debt", titleTwo: String(self.scoreModel?.creditReportInfo?.changeInShortTermDebt ?? 0))
                return cell
            }
        }
        else if indexPath.row == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreDetailTableViewCell.identifier) as? ScoreDetailTableViewCell {
                cell.decorateCell(titleOne: "Current long term debt", titleTwo: String(self.scoreModel?.creditReportInfo?.currentLongTermDebt ?? 0))
                return cell
            }
        }
        return UITableViewCell()
    }
}
