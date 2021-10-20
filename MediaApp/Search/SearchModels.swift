//
//  SearchModels.swift
//  MediaApp
//
//  Created by admin on 19.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getMusic(music: String)
        case getBook(book: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentMusic
        case presentBooks
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case musicViewModel
        case bookViewModel
      }
    }
  }
  
}
