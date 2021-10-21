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
    case .presentMusic(let searchResults):
        let musicsCell = searchResults?.results.map({ music in
            cellViewModel(from: music)
        }) ?? []
        
        let musicViewModel = MusicViewModel.init(cells: musicsCell)
        
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayMusic(musicViewModel: musicViewModel))
        print("I'm search results -- ", searchResults)
    case .presentBooks:
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.bookViewModel)
    }
  }
    
    private func cellViewModel(from data: Music) -> MusicViewModel.MusicCell {
        return MusicViewModel.MusicCell.init(trackName: data.trackName,
                                             artistName: data.artistName,
                                             artworkUrl100: data.artworkUrl100)
    }
}
