//
//  HomeView.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class HomeView: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "home")
        return imageView
    }()
            
    let generateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Generar usuario", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(generate), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        self.configUI()
        setAutoLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        indicator.stopAnimating()
        generateButton.isUserInteractionEnabled = true
    }
            
    private func configUI() {
        self.navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor.green
        self.view.addSubview(backgroundImage)
        self.view.addSubview(generateButton)
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            generateButton.heightAnchor.constraint(equalToConstant: 50),
            generateButton.widthAnchor.constraint(equalToConstant: 250),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
        ])
    }
    
    @objc func generate() {
        showLoader()
        generateButton.isUserInteractionEnabled = false
        self.presenter?.generateUser()
    }
    
    func showLoader(){
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        indicator.color = .yellow
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        indicator.startAnimating()
    }
}

extension HomeView: HomeViewProtocol {
    
}

