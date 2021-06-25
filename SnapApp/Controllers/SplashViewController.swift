import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        checkLogin()
    }
    
    func checkLogin() {
        if UserDefaults.standard.bool(forKey: Key.login) {
            // if user has already logged then navigate direct to homescreen.
            
            // we use dispatqueue for  make custom splash screen.
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                guard let storyboard = self.storyboard else {
                    return
                }
                
                let vcHome = storyboard.instantiateViewController(withIdentifier: Identifier.Home)
                vcHome.modalTransitionStyle = .crossDissolve
                self.navigationController?.pushViewController(vcHome, animated: true)
            }
            
        } else {
            // if user is not logged but is first time we navigate to login page.
            
            guard let storyboard = self.storyboard else {
                return
            }
            
            let vcMain = storyboard.instantiateViewController(withIdentifier: Identifier.ViewController)
            vcMain.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(vcMain, animated: true)
        }
    }
}
