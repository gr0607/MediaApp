//
//  SearchInteractor.swift
//  MediaApp
//
//  Created by admin on 19.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
    
    switch request{
    
    case .getMusic(music: _):
        presenter?.presentData(response: Search.Model.Response.ResponseType.presentMusic)
        //connect to server for music
    case .getBook(book: let book):
        presenter?.presentData(response: Search.Model.Response.ResponseType.presentBooks)
    }
    
  }
  
}
