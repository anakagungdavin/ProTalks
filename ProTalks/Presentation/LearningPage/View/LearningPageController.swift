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
    var compareProcess = CompareViewModel()
    var tempSplited: Array<String> = [""]
    var isStarted: Bool = false
    var compareResult: Bool?
    var textModul: String?

    
    let disposeBag = DisposeBag()
    let reactText = BehaviorSubject<Array>(value: [])
    
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var textSpeech: UILabel!
    @IBOutlet weak var recognisedSpeech: UILabel!
    @IBOutlet weak var textBg: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var indicatorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        speechProcess.requestPermission(tapButton: micButton)
        
        reactText.subscribe{ [self] string in
            
            tempSplited = self.compareProcess.splitWord(sentences: string.element![0] as! String)
            print(tempSplited)
            self.textSpeech.text = (string.element![0] as! String)
            print("with rx \(string)")
            
        }.disposed(by: disposeBag)

    }
    
    @IBAction func tappedMic(_ sender: Any) {
        isStarted = !isStarted
        
        if isStarted {
            speechProcess.startSpeechRecog(textSpeech: recognisedSpeech)
            micButton.setImage(UIImage(systemName: "mic.circle.fill"), for: .normal)
        }else{
            compareResult = speechProcess.compareSentence(sentenceModul: tempSplited)
            speechProcess.cancelRecord()
            
            if compareResult == true{
                indicatorText.isHidden = false
                indicatorView.isHidden = false
                indicatorView.backgroundColor = .systemGreen
                indicatorText.text = "Correct"
            }else{
                indicatorText.isHidden = false
                indicatorView.isHidden = false
                indicatorView.backgroundColor = .red
                indicatorText.text = "Wrong"
            }
            
            micButton.setImage(UIImage(systemName: "mic.circle"), for: .normal)
        }
        
    }
    
    @IBAction func closeBut(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func viewSetup(){
        textBg.layer.cornerRadius = 15
        textSpeech.font = UIFont.boldSystemFont(ofSize: 24)
        indicatorView.isHidden = true
        indicatorText.isHidden = true
    }

}
