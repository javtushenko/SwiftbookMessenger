//
//  SetupProfileViewController.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 03.02.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fullImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
}


//MARK: - Setup Constarints
extension SetupProfileViewController {
    
    private func setupConstraints() {
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileViewControllerProvider.ContainerView>)
        -> SetupProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileViewControllerProvider.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<SetupProfileViewControllerProvider.ContainerView>) {
        }
    }
}
