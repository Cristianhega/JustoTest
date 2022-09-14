//
//  DetailView.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class DetailView: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    var user: User?
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var backImageView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "back")
        let tap = UITapGestureRecognizer(target: self, action: #selector(goBack))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        self.configUI()
        setAutoLayout()
    }
            
    private func configUI() {
        self.navigationItem.hidesBackButton = true
        self.view.addSubview(backgroundImage)
        self.view.addSubview(cardView)
        self.cardView.addSubview(backImageView)
        self.backImageView.addSubview(userImage)
        self.cardView.addSubview(nameLabel)
        self.cardView.addSubview(descriptionLabel)
        self.view.addSubview(backImage)
        self.setValues()
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 325),
            cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            backImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            backImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            backImageView.heightAnchor.constraint(equalToConstant: 200),
            backImageView.widthAnchor.constraint(equalToConstant: 200),
            
            userImage.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 5),
            userImage.centerXAnchor.constraint(equalTo: backImageView.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 190),
            userImage.widthAnchor.constraint(equalToConstant: 190),
            
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backImage.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
            backImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backImage.heightAnchor.constraint(equalToConstant: 60),
            backImage.widthAnchor.constraint(equalToConstant: 60),
                                    
        ])
    }
    
    func setValues(){
        if user != nil {
            if let picture = user?.results![0].picture?.large {
                let url = URL(string: picture)
                let data = try? Data(contentsOf: url!)

                if let imageData = data {
                    userImage.image = UIImage(data: imageData)
                }
            }
            
            if let name = user?.results![0].name?.first, let age = user?.results![0].dob?.age {
                nameLabel.text = name + ", " + String(describing: age)
            }
            
            if let city = user?.results![0].location?.city {
                descriptionLabel.text = city
            }
        }
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailView: DetailViewProtocol {
    
}

