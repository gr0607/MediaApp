//
//  SearchPresenter.swift
//  MediaApp
//
//  Created by admin on 19.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
    switch response {
    case .presentMusic:
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.musicViewModel)
    case .presentBooks:
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.bookViewModel)
    }
}
}
