//
//  HomeViewModel.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 28/07/22.
//

import Foundation
import UIKit

final class HomeViewModel: UIViewController{
    
    func instantiate(nameController: String?, identifierSB: String?, from: UIViewController?) -> Void{
        let storyboard = UIStoryboard(name: nameController!, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifierSB!)
        
        controller.modalPresentationStyle = .fullScreen
        from!.present(controller, animated: true, completion: nil)
    }

}
