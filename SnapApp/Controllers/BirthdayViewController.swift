import UIKit

class BirthdayViewController: UIViewController {

    @IBOutlet var txtBirthday: UITextField!
    @IBOutlet var btnBack: UIButton!
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
            let vc = storyboard.instantiateViewController(withIdentifier: Identifier.ShowUsername)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapChangeDatePickerValue(sender: UIDatePicker) {
        let dateFormat = "dd MMM yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: sender.date)
        
        txtBirthday.text = date
    }
}
