//
//  ViewController.swift
//  KVOEx
//
//  Created by fyz on 9/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    var nameLabel = UILabel()
    var ageLabel = UILabel()
    var editButton = UIButton()
    var container = UIStackView()
    
    @objc let person = Person()
    
    var nameObservation: NSKeyValueObservation?
    var ageObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        nameLabel.text = person.name
        ageLabel.text = "\(person.age)"
        editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
        
        nameObservation = observe(\ViewController.person.name, options: [.new], changeHandler: {[weak self] VC, change in
            guard let updatedName = change.newValue else {return}
            self?.nameLabel.text = updatedName
            print("Name changed to \(updatedName)")
        })
        
        ageObservation = observe(\ViewController.person.age, options: [.new], changeHandler: { [weak self] VC, change in
            guard let updatedAge = change.newValue else {return}
            self?.ageLabel.text = String(updatedAge)
            print("Age changed to \(updatedAge)")
            
        })
        
    }
    @objc func editTapped() {
        let secondVc = SecondViewController()
        secondVc.person = person
        navigationController?.pushViewController(secondVc, animated: true)
    }
    func setUpUI() {
        container.axis = .vertical
        view.addSubview(container)
        container.addArrangedSubview(nameLabel)
        container.addArrangedSubview(ageLabel)
        container.addArrangedSubview(editButton)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.distribution = .fillEqually
        container.alignment = .fill
        container.spacing = 20
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        nameLabel.font = .systemFont(ofSize: 25)
        ageLabel.font = .systemFont(ofSize: 25)
        editButton.titleLabel?.font = .systemFont(ofSize: 25)
        nameLabel.textAlignment = .center
        ageLabel.textAlignment = .center
        editButton.center = container.center
        
        editButton.setTitle("Edit Info", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
    }

}

