//
//  ActivityViewController.swift
//  FindActivityApp
//
//  Created by Илья Нечаев on 26.09.2021.
//

import UIKit

class ActivityViewController: UIViewController {
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var participantsLabel: UILabel!
    @IBOutlet var activityLabel: UILabel!
    
    @IBOutlet var priceProgressView: UIProgressView!
    @IBOutlet var accessibilityProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVC()
    }
    
    @IBAction func findAgainPressed(_ sender: UIButton) {
        self.viewDidLoad()
    }
}

extension ActivityViewController {
    private func updateVC() {
        NetworkManager.shared.getResult { result in
            switch result {
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activityLabel.text = activity.activity
                    self.typeLabel.text = "Type: \(activity.type ?? "")"
                    self.participantsLabel.text = "Participants: \(activity.participants ?? 0)"
                    
                    self.priceProgressView.setProgress(activity.price ?? 0, animated: false)
                    self.accessibilityProgressView.setProgress(activity.accessibility ?? 0, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
