//
//  DetailPresenter.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    var presenter: DetailPresenterProtocol?
    var router: DetailRouterProtocol?
}

extension DetailPresenter: DetailOutputInteractorProtocol {
    
}
