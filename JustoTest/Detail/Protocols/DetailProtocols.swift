//
//  DetailProtocols.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

protocol DetailViewProtocol: class {
    // Presenter -> View
}

protocol DetailInputViewProtocol: class {
    // Presenter -> View
}

protocol DetailPresenterProtocol: class {
    // View -> Presenter
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var router: DetailRouterProtocol? {get set}
}

protocol DetailInteractorProtocol: class {
    var presenter: DetailOutputInteractorProtocol? {get set}
    // Presenter -> Interactor
}

protocol DetailOutputInteractorProtocol: class {
    // Interactor -> PresenterOutput
}

protocol DetailRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
}
