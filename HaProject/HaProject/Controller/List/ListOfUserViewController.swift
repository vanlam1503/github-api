//
//  ListOfUserViewController.swift
//  HaProject
//
//  Created by Ha on 15/2/25.
//

import UIKit
import Alamofire

final class ListOfUserViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: ListOfUserViewModel
    
    init(viewModel: ListOfUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of user"
        configCollectionView()
        fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "UserCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView.collectionViewLayout = layout
    }
    
    private func fetchUsers() {
        viewModel.fetchUsers { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.collectionView.reloadData()
            case .failure(let error):
                this.viewModel.errorService.showError(from: this, error: error)
            }
        }
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController?.present(alert, animated: true)
    }
}

extension ListOfUserViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfitems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCollectionViewCell
        cell.updateUI(urlString: viewModel.getUserAvatarString(at: indexPath.row))
        return cell
    }
}
