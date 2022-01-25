//
//  CarsListViewController.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import UIKit

class CarsListViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var tableView : UITableView!
    
    // MARK: - VARIABLES
    var viewModel: CarsListViewModel!
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindVM()
        self.setupView()
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }
    
    private func bindVM() {
        self.viewModel.showData = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
        
        self.viewModel.showLoader = { print("Show Loader") }
        self.viewModel.hideLoader = { print("Hide Loader") }
    }
    
    
    // MARK: - BUTTON ACTIONS

}

extension CarsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnCar(of: indexPath.row)
    }
}

extension CarsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.viewModel.getCarName(at: indexPath.row)
        return cell!
    }
    
}
