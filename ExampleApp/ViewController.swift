//
//  ViewController.swift
//  ExampleApp
//
//  Created by Sebastian Owodzin on 30/08/2017.
//  Copyright © 2017 mobiletoolkit.org. All rights reserved.
//

import RuntimeLocalizable
import UIKit

class ViewController: UIViewController {

    enum Language: Int {
        case `default` = 0
        case en = 1
        case pl = 2
    }

    @IBOutlet var languageSelectionButtons: [UIButton]!

    @IBAction func showMessage(_ sender: UIButton) {
        let alertTitle = NSLocalizedString("Welcome", comment: "")
        let alertMessage = NSLocalizedString("Some example text...", comment: "")
        let cancelButtonText = NSLocalizedString("Cancel", comment: "")

        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        languageSelectionButtons.forEach { button in
            button.addTarget(self, action: #selector(handleLanguageChange(_:)), for: .touchUpInside)
        }
    }


    func handleLanguageChange(_ sender: UIButton) {
        let selectedLanguage = Language.init(rawValue: sender.tag)!

        switch selectedLanguage {
        case .en:
            Bundle.setLanguage("en")
        case .pl:
            Bundle.setLanguage("pl")
        default:
            Bundle.resetLanguage()
        }

        // need to reload VC to update all the controls
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = storyboard?.instantiateInitialViewController()

//        let alert = UIAlertController(title: "handleLanguageChange", message: "selectedLanguage: \(selectedLanguage)", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//
//        present(alert, animated: true, completion: nil)
    }
}

