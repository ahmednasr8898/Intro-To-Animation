//
//  ViewController.swift
//  IntroToAnimation
//
//  Created by Ahmed Nasr on 12/24/20.
//
import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var topLoginButtonconstraint: NSLayoutConstraint!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingIndicator.isHidden = true
        hideAnimation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewAnimation()
    }
    @IBAction func loginOnClick(_ sender: UIButton) {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        showIndicator()
    }
    func hideAnimation(){
        let scaleImageAnimation = CGAffineTransform(scaleX: 0, y: 0)
        self.carImageView.transform = scaleImageAnimation
        let leftAnimation = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        self.nameTextField.transform = leftAnimation
        let rightAnimation = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        self.passwordTextField.transform = rightAnimation
    }
    func viewAnimation(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1) {
                self.carImageView.transform = .identity
                self.nameTextField.transform = .identity
                self.passwordTextField.transform = .identity
            }
        }
    }
    func showIndicator(){
        topLoginButtonconstraint.constant = 120
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        } completion: { (_) in
            self.loadingIndicator.isHidden = false
            self.loadingIndicator.startAnimating()
        }
    }
}

