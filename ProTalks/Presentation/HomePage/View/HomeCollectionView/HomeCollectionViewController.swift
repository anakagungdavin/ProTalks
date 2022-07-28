//
//  HomeCollectionViewController.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 26/07/22.
//

import Foundation

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    modulsVar.bind(to: collectionView
//        .rx
//        .items(cellIdentifier: "homeCollectionCell", cellType: UICollectionViewCell.self)
//    ){ (row, item, cell) in
//        cell.imageView?.image = UIImageView(image: UIImage(named: listModuls[indexPath.item].image!))
//    }.disposed(by: disposeBag)
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModuls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell" , for: indexPath) as! HomeCollectionCell
        
        let modulImage = UIImage(named: listModuls[indexPath.item].image!)
        let modulImageView = UIImageView(image: modulImage)
        modulImageView.contentMode = .scaleAspectFill
        modulImageView.frame.size = CGSize(width: 180, height: 200)
    
        cell.addSubview(modulImageView)
        cell.backgroundColor = .red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "LearningPageController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LearningPageSB")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LearningPageSB") as? LearningPageController{
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
//            }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        
        return CGSize(width: size, height: 200)
    }
}

class HomeCollectionCell: UICollectionViewCell{
    override func awakeFromNib() {
        layer.cornerRadius = 15
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        
    }
}
