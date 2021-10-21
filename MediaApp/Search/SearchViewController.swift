//
//  SearchViewController.swift
//  MediaApp
//
//  Created by admin on 19.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: AnyObject {
  func displayData(viewModel: Search.Model.ViewModel.ViewModelData)
}

class SearchViewController: UIViewController, SearchDisplayLogic {

    private var musicViewModel = MusicViewModel.init(cells: [])
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    
    
  var interactor: SearchBusinessLogic?
  var router: (NSObjectProtocol & SearchRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = SearchInteractor()
    let presenter             = SearchPresenter()
    let router                = SearchRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    myTable.dataSource = self
    myTable.delegate = self
    
    let nib = UINib(nibName: "InfoCell", bundle: nil)
    myTable.register(nib, forCellReuseIdentifier: InfoCell.reuseId)
  }

    func displayData(viewModel: Search.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayMusic(let musicViewModel):
            self.musicViewModel = musicViewModel
            myTable.reloadData()
        case .bookViewModel:
            print("book")
        }
    }
    
    
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.interactor?.makeRequest(request: Search.Model.Request.RequestType.getMusic(music: searchText))
    }
    
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicViewModel.cells.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.reuseId, for: indexPath) as? InfoCell
        
        guard let infoCell = cell else { return UITableViewCell() }
        
        let musicViewModel = musicViewModel.cells[indexPath.row]
        infoCell.set(infoCellModel: musicViewModel)
        
        return infoCell
    }
}

//MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
