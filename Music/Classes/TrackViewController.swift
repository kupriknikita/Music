//
//  TrackViewController.swift
//  Music
//
//  Created by Nikita Kuprik on 6/25/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit
import AVFoundation

class TrackViewController: UIViewController {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         trackNameLabel.text = tracks[trackIsPlaying]
        
        if audioIsEnabled == false {
            trackNameLabel.isHidden = true
            trackImageView.isHidden = true
            pauseButton.isHidden = true
            playButton.isHidden = true
            prevButton.isHidden = true
            nextButton.isHidden = true
            volumeSlider.isHidden = true
        } else {
            trackNameLabel.isHidden = false
            trackImageView.isHidden = false
            pauseButton.isHidden = false
            prevButton.isHidden = false
            nextButton.isHidden = false
            volumeSlider.isHidden = false
        }
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if audioIsEnabled == true  && !audioPlayer.isPlaying {
            audioPlayer.play()
        }
        
        playButton.isHidden = true
        pauseButton.isHidden = false
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        if audioIsEnabled == true && audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        
        playButton.isHidden = false
        pauseButton.isHidden = true
    }
    
    @IBAction func prevTapped(_ sender: Any) {
        if trackIsPlaying != 0 && audioIsEnabled == true {
            playThisTrack(trackName: tracks[trackIsPlaying - 1])
            trackIsPlaying -= 1
            trackNameLabel.text = tracks[trackIsPlaying]
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if trackIsPlaying < tracks.count - 1 && audioIsEnabled == true {
            playThisTrack(trackName: tracks[trackIsPlaying + 1])
            trackIsPlaying += 1
            trackNameLabel.text = tracks[trackIsPlaying]
        }
    }
    
    @IBAction func durationSlider(_ sender: UISlider) {
        if audioIsEnabled == true {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThisTrack(trackName: String) {
        do {
            let audioPath = Bundle.main.path(forResource: trackName, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        } catch {
            print("Error")
        }
    }

}
