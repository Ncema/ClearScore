//
//  ClearScoreViewController.swift
//  ClearScore
//
//  Created by Rider on 2026/03/16.
//

import UIKit

class ClearScoreViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var presenter: ScorePresentable?
    var scoreModel: ScoreModel?
    var wireframe: WireframeDelegate?
    
    
    //MARK: - SetUpTableView
    func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        //register the cell on the table view
        self.tableView.register(UINib.init(nibName: ClearScoreTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ClearScoreTableViewCell.identifier)
    }
    
    
    //MARK: - Lifecycle
    convenience init() {
        self.init(nibName: "ClearScoreViewController", bundle: nil)
    }
    
    override init(nibName nibNameorNil: String?, bundle nibBundleorNil: Bundle?) {
        super.init(nibName: nibNameorNil, bundle: nibBundleorNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = DependencyContainer.makeScoreModule()
        self.presenter?.view = self
        self.fetchScore()
        overrideUserInterfaceStyle = .light
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpTableView()
    }
    
    
    //MARK: - Helper method
    func fetchScore() {
        self.showBusyView()
        self.presenter?.fetchScore()
    }
}


extension ClearScoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ClearScoreTableViewCell.identifier, for: indexPath) as? ClearScoreTableViewCell {
                    cell.decorateCell(clearScorePercentage: String(self.scoreModel?.creditReportInfo?.score ?? 0), subTitle: String("out of \(self.scoreModel?.creditReportInfo?.maxScoreValue ?? 0)"), delegate: self)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}


extension ClearScoreViewController: ScorePresenterViewable {
    func fetchScoreSuccess(score: ScoreModel) {
        self.scoreModel = score
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideBusyView()
        }
    }
    
    func fetchScoreFailure(error: String) {
        DispatchQueue.main.async {
            self.hideBusyView()
            self.tableView.isHidden = true
            self.showErrorMessage(title: "Clear Score", message: error)
        }
    }
}


extension ClearScoreViewController: ClearScoreTableViewCellDelegate {
    func didTapClearScoreCircle() {
        Wireframe.shared.transitionToScoreDetailViewController(controller: self, scoreModel: self.scoreModel)
    }
}

