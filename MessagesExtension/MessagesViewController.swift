//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by James Rochabrun on 1/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var catView: UIImageView!
    @IBOutlet weak var dogView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var imageViewWidth: CGFloat {
        return self.catView.frame.size.width
    }
    var innerSpace: CGFloat {
        return (self.catView.frame.minX - self.dogView.frame.minX) - self.imageViewWidth
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dogView.clipsToBounds = true
        self.dogView.isUserInteractionEnabled = true
        self.dogView.contentMode = .scaleAspectFit
        self.dogView.backgroundColor = UIColor.cyan
       // self.dogView.image = #imageLiteral(resourceName: "puppy")
        
        let dogRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectDogOntap))
        dogView.addGestureRecognizer(dogRecognizer)
        dogView.layer.cornerRadius = self.imageViewWidth/2
        
        self.catView.clipsToBounds = true
        self.catView.isUserInteractionEnabled = true
        self.catView.contentMode = .scaleAspectFit
        self.catView.backgroundColor = UIColor.cyan
        //self.catView.image = #imageLiteral(resourceName: "kitty")
        self.catView.layer.cornerRadius = self.imageViewWidth/2
        let catRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectCatOntap))
        catView.addGestureRecognizer(catRecognizer)
        
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelSelection(_:)), for: .touchUpInside)
        cancelButton.alpha = 0
        cancelButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        
        nextButton.setTitle("next", for: .normal)
        nextButton.alpha = 0
        nextButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    }
    
    func selectDogOntap(_ sender: UIGestureRecognizer) {
        
        let deltaX = (self.dogView.frame.size.width - self.innerSpace)/2
        let translationX = self.dogView.frame.size.width - deltaX
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [unowned self] in
            
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            var translate = CGAffineTransform(translationX: translationX, y: 0.0)
            self.dogView.transform = scale.concatenating(translate)
            self.dogView.isUserInteractionEnabled = false
            
            self.catView.alpha = 0
            translate = CGAffineTransform(translationX: -translationX, y: 0.0)
            self.catView.transform = translate
            
            self.cancelButton.alpha = 1
            self.nextButton.alpha = 1
            self.titleLabel.alpha = 0
            
            }, completion: nil)
    }
    
    func selectCatOntap(_ sender: UIGestureRecognizer) {
        
        let deltaX = (self.catView.frame.size.width - self.innerSpace)/2
        let translationX =  self.catView.frame.size.width - deltaX
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [weak self] in
            
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            var translate = CGAffineTransform(translationX: -translationX, y: 0.0)
            self?.catView.transform = scale.concatenating(translate)
            self?.catView.isUserInteractionEnabled = false
            
            self?.dogView.alpha = 0
            translate = CGAffineTransform(translationX: translationX, y: 0.0)
            self?.dogView.transform = translate
            
            self?.cancelButton.alpha = 1
            self?.nextButton.alpha = 1
            
            self?.titleLabel.alpha = 0
            
            }, completion: nil)
    }
    
    func cancelSelection(_ sender:UIButton) {
        
        let scale = CGAffineTransform.identity
        let translate = CGAffineTransform(translationX: 0.0, y: 0.0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [unowned self] in
            
            self.catView.transform = scale.concatenating(translate)
            self.dogView.transform = scale.concatenating(translate)
            self.dogView.alpha = 1
            self.catView.alpha = 1
            self.dogView.isUserInteractionEnabled = true
            self.catView.isUserInteractionEnabled = true
            self.cancelButton.alpha = 0
            self.nextButton.alpha = 0
            self.titleLabel.alpha = 1
            }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}

extension UIView {
    
}






