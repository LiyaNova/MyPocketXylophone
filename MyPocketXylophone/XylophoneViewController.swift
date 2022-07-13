//
//  XylophoneViewController.swift
//  MyPocketXylophone
//
//  Created by Юлия Филимонова on 05.07.2022.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {

    private var xylophoneView: XylophoneView!
    private var player: AVAudioPlayer?

    override func loadView() {
        super.loadView()
        xylophoneView = XylophoneView()
        xylophoneView.delegate = self
        view = xylophoneView
    }

    private func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

//MARK: - TapDelegate

extension XylophoneViewController: TapDelegate {
    func tapNote(musicNote: String) {
        playSound(sound: musicNote)
    }
}

