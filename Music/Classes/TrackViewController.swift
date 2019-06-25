//
//  TrackViewController.swift
//  Music
//
//  Created by Nikita Kuprik on 6/25/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.isHidden = true
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
        
        playButton.isHidden = true
        pauseButton.isHidden = false
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        
        playButton.isHidden = false
        pauseButton.isHidden = true
    }
    
    @IBAction func prevTapped(_ sender: Any) {
    }
    
    @IBAction func nextTapped(_ sender: Any) {
    }
    
    @IBAction func durationSlider(_ sender: UISlider) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
