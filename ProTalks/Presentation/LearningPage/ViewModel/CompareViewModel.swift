//
//  CompareViewModel.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 27/07/22.
//

import Foundation
import RxSwift

final class CompareViewModel: UIViewController{
    
    func splitWord(sentences: String) -> Array<String>{
        var newSentences = sentences
        
        newSentences = sentences.replacingOccurrences(of: ".", with: "")
        newSentences = newSentences.replacingOccurrences(of: "!", with: "")
        newSentences = newSentences.replacingOccurrences(of: "?", with: "")
        newSentences = newSentences.replacingOccurrences(of: ",", with: "")
        newSentences = newSentences.uppercased()
        
        let splits = newSentences.components(separatedBy: .whitespaces)
        
        return splits
    }
    
}
