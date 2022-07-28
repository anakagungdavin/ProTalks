//
//  LearningPageViewMode.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 27/07/22.
//

import Foundation
import Speech
import UIKit
import RxSwift

final class LearningPageViewModel: UIViewController, SFSpeechRecognizerDelegate{
    
    let audioEngine = AVAudioEngine()
    let speechRecog: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
//    let conditionVar = Observable.just(conditionText)
    var recognitionTask: SFSpeechRecognitionTask!
    var bestString: String? = ""
    var compareProcess = CompareViewModel()
    
    func alertView(message: String){
        let controller = UIAlertController.init(title: "Error occured", message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in controller.dismiss(animated: true, completion: nil)}))
        self.present(controller, animated: true, completion: nil)
    }
    
    func requestPermission(tapButton: UIButton){
        tapButton.isEnabled = false
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation{
                switch authState{
                case .authorized:
                    print("Accepted")
                    tapButton.isEnabled = true
                
                case .denied:
                    self.alertView(message: "User Denied The Permission")
                    
                case .notDetermined:
                    self.alertView(message: "No Speech Reconition in Your Phone")
                    
                case .restricted:
                    self.alertView(message: "User has been Restricted for Using Speech Recognition")
                    
                @unknown default:
                    self.alertView(message: "Unknown Error")
                }
            }
        }
    }
    
    func startSpeechRecog(textSpeech: UILabel){
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do{
            try audioEngine.start()
        } catch{
            return print(error)
        }
        
        guard let myRecognizer = SFSpeechRecognizer() else {
            self.alertView(message: "Speech recognition is not supported for your current locale.")
            return
        }
        if !myRecognizer.isAvailable{
            self.alertView(message: "Speech recognition is not currently available. Check back at a later time.")
            return
        }
        
        request.shouldReportPartialResults = true
        
        //this where i can customize the word to be different color klo bener
        recognitionTask = speechRecog?.recognitionTask(with: request, resultHandler: { [self] (result, error) in
//            var isFinal = true
            
            if let result = result {
                self.bestString = result.bestTranscription.formattedString
                textSpeech.text = self.bestString
                
//                isFinal = result.isFinal
                print(self.bestString ?? "")
                
            } else if let error = error {
                print(error)
            }
            
        })
    }
    
    func cancelRecord(){
        self.recognitionTask?.finish()
        self.recognitionTask = nil
        
        // stop audio
        self.request.endAudio()
        self.audioEngine.stop()
        self.audioEngine.inputNode.removeTap(onBus: 0)
    }
    
    func compareSentence(sentenceModul: Array<String>) -> Bool{
        //Process the comparison data
        let tempSplitted = compareProcess.splitWord(sentences: bestString ?? "")
        
        if tempSplitted == sentenceModul{
            return true
        }else{
            return false
        }
    }
    
}
