import UIKit
import FirebaseAuth

class EmailViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var btnContinue: UIButton!
    
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        btnContinue.layer.cornerRadius = btnContinue.frame.size.height / 2
    }

    @IBAction func didTapBackButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapContinueButton(sender: UIButton) {
        guard let email = txtEmail.text else {
            return
        }
        
        if let password = password {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil {
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
}
