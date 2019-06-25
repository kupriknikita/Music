//
//  TrackListViewController.swift
//  Music
//
//  Created by Nikita Kuprik on 6/25/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit
import AVFoundation

var tracks: [String] = []
var audioPlayer = AVAudioPlayer()

class TrackListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var trackListTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "trackCell")
        cell.textLabel?.text = tracks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let audioPath = Bundle.main.path(forResource: tracks[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        } catch {
            print("Error")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getTrackName()
    }
    
    func getTrackName() {
        let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do {
            let trackPath = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for track in trackPath {
                var currentTrack = track.absoluteString
    
                if currentTrack.contains(".mp3") {
                    let findString = currentTrack.components(separatedBy: "/")
                    currentTrack = findString[findString.count-1]
                    currentTrack = currentTrack.replacingOccurrences(of: "%20", with: " ")
                    currentTrack = currentTrack.replacingOccurrences(of: ".mp3", with: "")
                    tracks.append(currentTrack)
                    tracks.sort()
                }
            }
            
            trackListTableView.reloadData()
        } catch {
            //
        }
    }
    
}
