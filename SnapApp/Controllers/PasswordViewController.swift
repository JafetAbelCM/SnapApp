import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnContinue: UIButton!
    
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
        guard let password = txtPassword.text  else {
            return
        }
        
        guard let storyboard = self.storyboard else {
            return
        }
        
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.SetEmail) as! EmailViewController
            vc.password = password
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
