//
//  HomeProtocols.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

protocol HomeViewProtocol: class {
    // Presenter -> View
}

protocol HomeInputViewProtocol: class {
    // Presenter -> View
}

protocol HomePresenterProtocol: class {
    // View -> Presenter
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    func generateUser()
}

protocol HomeInteractorProtocol: class {
    var presenter: HomeOutputInteractorProtocol? {get set}
    // Presenter -> Interactor
    func generateUser(from view: UIViewController)
}

protocol HomeOutputInteractorProtocol: class {
    // Interactor -> PresenterOutput
    func retry()
    func sendInfo(user: User)
}

protocol HomeRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
    func pushToDetailView(from view: UIViewController, user: User)
}
