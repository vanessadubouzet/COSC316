//
//  ViewController.swift
//  AVPlayerDemo
//
//  Created by Vanessa Dubouzet on 2024-02-29.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destination = segue.destination as! AVPlayerViewController
//        let url = URL(string: "https://www.ebookfrenzy.com/ios_book/movie/movie.mov")
//
//        if let movieURL = url {
//        destination.player = AVPlayer(url: movieURL)
//        }
        
        if let path = Bundle.main.path(forResource: "mov_bbb", ofType:"mp4") {
         destination.player = AVPlayer(url: URL(fileURLWithPath: path))
         } else {
         debugPrint("mov_bbb.mp4 not found")
         return
         }
    }
}

