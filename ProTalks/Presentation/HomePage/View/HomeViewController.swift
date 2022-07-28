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
    let modulsVar = Observable.just(listModuls)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
    }
    
}

