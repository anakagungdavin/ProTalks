//
//  ViewController.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 20/07/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag()
    let viewModel = HomeViewModel()
    let modulsVar = Observable.just(listModuls)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelOne: UILabel!
    @IBOutlet weak var titleLabelTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        bindCollData()
//        collectionView.dataSource = self
    }
    
    func viewSetup(){
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabelOne.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabelTwo.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
}

