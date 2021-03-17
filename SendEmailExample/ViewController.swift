//
//  ViewController.swift
//  SendEmailExample
//
//  Created by Lin Yi Sen on 2021/3/17.
//  Copyright © 2021 Swift. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var sendEmailBtn: UIButton! {
        didSet {
            sendEmailBtn.layer.cornerRadius = 5
            sendEmailBtn.clipsToBounds = true
        }
    }
    @IBAction func sendEmailAction(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let vc = MFMailComposeViewController()
            vc.mailComposeDelegate = self
            vc.setSubject("聯絡我們｜給我們建議") // 標題
            vc.setToRecipients(["xxxABC@gmail.com"])    // 收件者
            vc.setMessageBody("<h1>Hello !</h1>", isHTML: true) // 信件內容
            present(vc, animated: true)
        } else {
            guard let url = URL(string: "https://www.google.com") else { return }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true)
    }


}

