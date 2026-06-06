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
    private  let  viewModel: ClearScoreViewModel?
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
     init(viewModel: ClearScoreViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: "ClearScoreViewController", bundle: nil)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.setUpTableView()
        self.bindViewModel()
        self.fetchScore()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    //MARK: - Helper method
    func fetchScore() {
        self.showBusyView()
        self.viewModel?.fetchScore()
    }
    
    private func bindViewModel() {

        viewModel?.onScoreLoaded = { [weak self] in
             DispatchQueue.main.async {
                 self?.hideBusyView()
                 self?.tableView.reloadData()
             }
         }

         viewModel?.onError = { [weak self] error in
             DispatchQueue.main.async {
                 self?.hideBusyView()
                 self?.tableView.isHidden = true
                 self?.showErrorMessage(
                     title: "Clear Score",
                     message: error)
             }
         }
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
                    cell.decorateCell(clearScorePercentage: String(self.viewModel?.scoreModel?.creditReportInfo?.score ?? 0), subTitle: String("out of \(self.viewModel?.scoreModel?.creditReportInfo?.maxScoreValue ?? 0)"), delegate: self)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}


extension ClearScoreViewController: ClearScoreTableViewCellDelegate {

    func didTapClearScoreCircle() {
        let detailVC = ScoreDetailViewController(viewModel: self.viewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
