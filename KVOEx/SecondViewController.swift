//
//  SecondViewController.swift
//  KVOEx
//
//  Created by fyz on 9/29/22.
//

import UIKit

class SecondViewController: UIViewController {
    @objc var person = Person()
    
    var nameField = UITextField()
    var ageField = UITextField()
    var updateButton = UIButton()
    var container = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        updateButton.addTarget(self, action: #selector(updateTapped), for: .touchUpInside)
        
    }
    @objc func updateTapped(){
        if let nameText = nameField.text,  let ageText = ageField.text {
            person.name = nameText
            person.age = Int(ageText) ?? 0
            navigationController?.popViewController(animated: true)
        }
    }
    func setUpUI() {
        view.addSubview(container)
        container.addArrangedSubview(nameField)
        container.addArrangedSubview(ageField)
        container.addArrangedSubview(updateButton)
        
        container.axis = .vertical
        container.distribution = .fillEqually
        container.alignment = .fill
        container.spacing = 20
        
        container.translatesAutoresizingMaskIntoConstraints = false
        nameField.translatesAutoresizingMaskIntoConstraints = false
        ageField.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameField.font = .systemFont(ofSize: 25)
        ageField.font = .systemFont(ofSize: 25)
        nameField.placeholder = "Enter name"
        ageField.placeholder = "Enter age"

        updateButton.setTitle("Update", for: .normal)
        updateButton.setTitleColor(.blue, for: .normal)
        updateButton.titleLabel?.font = .systemFont(ofSize: 25)
        
        nameField.textAlignment = .center
        ageField.textAlignment = .center
        updateButton.center = container.center
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
