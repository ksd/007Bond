//
//  BondViewController.swift
//  007Bond
//
//  Created by ksd on 24/11/2022.
//

import UIKit
import AVFoundation

class BondViewController: UIViewController {
    var bondService: BondService?
    
    
    @IBOutlet weak var bondImageView: UIImageView!
    @IBOutlet weak var bondLabel: UILabel!
    @IBOutlet weak var bondActiveLabel: UILabel!
    
    @IBAction func bondTap(_ sender: UITapGestureRecognizer) {
        if let bondService = bondService, let firstbond = bondService.listOfBonds.first {
           updateBondGUI(firstbond)
        }
    }
    
    @IBAction func soundAction(_ sender: UIButton) {
        if soundPlayer!.isPlaying {
            soundPlayer?.pause()
            sender.setTitle("Play", for: .normal)
        } else {
            soundPlayer?.play()
            sender.setTitle("Pause", for: .normal)
        }
    }
    private var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bond = selectRandomBondName()
        updateBondGUI(bond)
        
        let path = Bundle.main.path(forResource: "theme", ofType: "aiff")
        if let path = path {
            let url = NSURL.fileURL(withPath: path)
            do {
                try soundPlayer = AVAudioPlayer(contentsOf: url)
                soundPlayer?.prepareToPlay()
                soundPlayer?.play()
                
            } catch {
                print("FEJL")
            }
        }
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let bond = selectRandomBondName()
       updateBondGUI(bond)
    }
    
    private func selectRandomBondName() -> Bond
    {
        return (bondService?.listOfBonds.randomElement()!)!
    }
    
    private func updateBondGUI(_ randondomBond: Bond) {
        bondImageView.image = UIImage(named: randondomBond.image)
        bondLabel.text = randondomBond.name
        bondActiveLabel.text = randondomBond.active
    }
}

