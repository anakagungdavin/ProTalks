//
//  LearningPage.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 26/07/22.
//

import Foundation
import UIKit
import RxSwift
import Speech

class LearningPageController: UIViewController, SFSpeechRecognizerDelegate{
    
    var speechProcess = LearningPageViewModel()
    var isStarted: Bool = false
    
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var textSpeech: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechProcess.requestPermission(tapButton: micButton)
    }
    
    @IBAction func tappedMic(_ sender: Any) {
        isStarted = !isStarted
        
        if isStarted {
            speechProcess.startSpeechRecog(textSpeech: textSpeech)
            micButton.setImage(UIImage(systemName: "mic.circle.fill"), for: .normal)
        }else{
            speechProcess.cancelRecord()
            micButton.setImage(UIImage(systemName: "mic.circle"), for: .normal)
        }
        
    }
    
    @IBAction func closeBut(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
