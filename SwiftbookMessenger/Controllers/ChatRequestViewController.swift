//
//  ChatRequestViewController.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 11.02.2022.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: UIImage(named: "human2"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Иван", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "Обо мне: ничего не боюсь", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(isShadow: false,
                                titleColor: .white,
                                title: "ПРИНЯТЬ",
                                backgroundcolor: .buttonBlack(),
                                font: .laoSangamMN20(),
                                cornerRadius: 10)
    let denyButton = UIButton(isShadow: false,
                              titleColor: UIColor(rgb: 0xD53333),
                              title: "ОТКАЗАТЬ",
                              backgroundcolor: .mainWhite(),
                              font: .laoSangamMN20(),
                              cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = UIColor(rgb: 0xD53333).cgColor
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        acceptButton.apllyGradients(cornerRadius: 10)
    }
}

extension ChatRequestViewController {
    
    private func setupConstraints() {
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct ChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestViewControllerProvider.ContainerView>) -> ChatRequestViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ChatRequestViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestViewControllerProvider.ContainerView>) {
        }
    }
}
