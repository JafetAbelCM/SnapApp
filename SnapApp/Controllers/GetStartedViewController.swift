import UIKit
import Contacts

class GetStartedViewController: UIViewController {
    
    @IBOutlet var btnContinue: UIButton!
    
    var contactStore = CNContactStore()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        btnContinue.layer.cornerRadius = btnContinue.frame.size.height / 2
    }
    
    // MARK: - get contact access permission
    
    func requestForContactAccess(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        switch authorizationStatus {
        case .authorized:
            completionHandler(true)
        case .denied, .notDetermined:
            self.contactStore.requestAccess(for: .contacts,
                completionHandler: { (access, accessError) -> Void in
                    if access {
                        completionHandler(access)
                    } else {
                        if authorizationStatus == .denied {
                            DispatchQueue.main.async(execute: { () -> Void in
                                let message =
                                    "\(accessError!.localizedDescription)\n\nPlease allow the app to access your contacts through the Settings"
                                print(message)
                            })
                        }
                    }
                })
        default:
            completionHandler(false)
        }
    }

    @IBAction func didTapContinueButton(sender: UIButton) {
        
        requestForContactAccess { (granted) in
            if granted {
                print(granted, "permission granted")
                UserDefaults.standard.set(true, forKey: Key.permission)
                
                guard let storyboard = self.storyboard else {
                    return
                    
                }
                
                DispatchQueue.main.async {
                    let vc = storyboard.instantiateViewController(withIdentifier: Identifier.SignUp)
                    self.navigationController?.pushViewController(vc, animated: true)
                }

            }
        }
        
    }
    
    @IBAction func didTapBackButton(sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
