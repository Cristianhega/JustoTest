//
//  HomePresenter.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var presenter: HomePresenterProtocol?
    var router: HomeRouterProtocol?
    
    func generateUser() {
        interactor?.generateUser(from: view as! UIViewController)
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func retry() {
        interactor?.generateUser(from: view as! UIViewController)
    }
    
    func sendInfo(user: User) {
        router?.pushToDetailView(from: view as! UIViewController, user: user)
    }
}
