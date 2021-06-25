import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var txtViewPolicy: UITextView!
    @IBOutlet var txtFirstName: UITextField!
    @IBOutlet var txtLastName: UITextField!
    @IBOutlet var btnSignUpAccept: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTxtView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        btnSignUpAccept.layer.cornerRadius = btnSignUpAccept.frame.size.height / 2
    }
    
    
    // MARK: - set up textview with hyperlink
    
    func setupTxtView() {
        guard let text = txtViewPolicy.text else {
            return
        }
        
        let path = "https://www.youtube.com/watch?v=WmYn0AvwD3E"
        let substring = "Privacy Policy"
        let attrString = NSAttributedString.createHPLink(text, substring, path)
        txtViewPolicy.attributedText = attrString
        txtViewPolicy.textColor = .gray
    }

    @IBAction func didTapSignUpAcceptButton(sender: UIButton) {
        guard let storyboard = self.storyboard else {
            return
        }
        
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.Birthday)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapBackButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
