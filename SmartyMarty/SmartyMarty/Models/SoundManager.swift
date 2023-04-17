//
//  SoundManager.swift
//  SmartyMarty
//
//  Created by Furkan Gonul on 2023-04-16.
//

import Foundation
import AVFoundation


public class SoundManager {

    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?

    private init() {}

    func playSound(forResource resource: String, ofType type: String) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: type) else {
            print("Unable to find sound file")
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
