import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        btnLogin.layer.cornerRadius = btnLogin.frame.size.height / 2
    }

    @IBAction func didTapBackButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapLoginButton(sender: UIButton) {
        guard let email = txtEmail.text else {
            return
        }
        
        guard let password = txtPassword.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                // if user logged with correct email and password we save to userdefault for key login
                
                UserDefaults.standard.set(true, forKey: Key.login)
                
                guard let storyboard = self.storyboard else {
                    return
                }
                
                DispatchQueue.main.async {
                    let vc = storyboard.instantiateViewController(withIdentifier: Identifier.Home)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
