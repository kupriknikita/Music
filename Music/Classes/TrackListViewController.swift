//
//  TrackListViewController.swift
//  Music
//
//  Created by Nikita Kuprik on 6/25/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getTrackName()
    }
    
    func getTrackName() {
        let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do {
            let trackPath = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for track in trackPath {
                let currentTrack = track.absoluteString
                
                if currentTrack.contains(".mp3") {
                    print(currentTrack)
                }
            }
            
        } catch {
            
        }
    }
    
}
