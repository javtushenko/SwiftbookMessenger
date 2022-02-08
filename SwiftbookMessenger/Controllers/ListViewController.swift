//
//  ListViewController.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 04.02.2022.
//

import UIKit

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class ListViewController: UIViewController {
    
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json" )
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json" )
    
    enum Section: Int, CaseIterable {
        case waitingChats, activeChats
    }
    
    var collectionView: UICollectionView!
    var dataSourse: UICollectionViewDiffableDataSource<Section, MChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        
        setupSearchBar()
        
        setupCollectionView()
        createDataSourse()
        reloadData()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(activeChats, toSection: .activeChats)
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        dataSourse?.apply(snapshot, animatingDifferences: true)
    }
    
}


//MARK: - Data Sourse
extension ListViewController {
    
    private func configure<T: SellConfiguringCell>(cellType: T.Type,
                                                   with value: MChat,
                                                   indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId,
                                                            for: indexPath) as? T
        else {
            fatalError("Unable to dequere \(cellType)")
        }
        
        cell.configure(with: value)
        return cell
    }
    
    private func createDataSourse() {
        dataSourse = UICollectionViewDiffableDataSource<Section,MChat>(collectionView: collectionView,
                                                                       cellProvider: { (collectionView, indexPath, chat)
            -> UICollectionViewCell in
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Uncnown section") }
            switch section {
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath )
                cell.backgroundColor = .systemBlue
                return cell
            case .activeChats:
                return self.configure(cellType: ActiveChatCell.self, with: chat, indexPath: indexPath)
            }
        })
    }
}


//MARK: - Setup layout
extension ListViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment)
            -> NSCollectionLayoutSection? in
            
            guard let section = Section(rawValue: sectionIndex) else { fatalError("Uncnown section") }
            switch section {
            case .waitingChats:
                return self.createWaitingChats()
            case .activeChats:
                return self.createActiveChats()
            }
        }
        return layout
    }
    
    private func createWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: sizeGroup, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top:  16, leading: 20, bottom: 0, trailing: 20)
        return section
    }
}


//MARK: - Setup Search Controller
extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}


//MARK: - SwiftUI
import SwiftUI

struct ListViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListViewControllerProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ListViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListViewControllerProvider.ContainerView>) {
        }
    }
}
