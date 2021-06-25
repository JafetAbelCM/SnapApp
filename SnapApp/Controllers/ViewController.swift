import UIKit

class ViewController: UIViewController {
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.layer.cornerRadius = btnLogin.frame.size.height / 2
        btnSignUp.layer.cornerRadius = btnSignUp.frame.size.height / 2
    }

    @IBAction func didTapLoginButton(sender: UIButton) {
        guard let storyboard = self.storyboard else {
            return
        }
        
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.SignIn)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapSignUpButton(sender: UIButton) {
        guard let storyboard = self.storyboard else {
            return
        }
        
        if UserDefaults.standard.bool(forKey: Key.permission) {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.SignUp)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.GetStarted)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

