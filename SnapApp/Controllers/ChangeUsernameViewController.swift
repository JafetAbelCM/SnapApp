import UIKit

class ChangeUsernameViewController: UIViewController {

    @IBOutlet var txtUsername: UITextField!
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
        guard let storyboard = self.storyboard else {
            return
        }
        
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.SetPassword)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
