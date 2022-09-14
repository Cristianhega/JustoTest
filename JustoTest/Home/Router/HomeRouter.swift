//
//  HomeRouter.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = HomeView()
        let router: HomeRouterProtocol = HomeRouter()
        let presenter: HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushToDetailView(from view: UIViewController, user: User) {
        let controller = DetailRouter.createModule() as! DetailView
        controller.user = user
        view.navigationController?.pushViewController(controller, animated: true)
        UIView.transition(with: (view.navigationController?.view)!, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve , animations: nil, completion: nil)
    }
}
