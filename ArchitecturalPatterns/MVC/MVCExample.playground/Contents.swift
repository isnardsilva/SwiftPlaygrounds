import UIKit

// MARK: - Model
struct Person {
    // MARK: - Properties
    let firstName: String
    let lastName: String
}



// MARK: - View + Controller
class GreetingViewController: UIViewController {
    // MARK: - Properties
    var person: Person?
    let greetingLabel = UILabel()
    let greetingButton = UIButton()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingButton.addTarget(self, action: #selector(didTapGreetingButton), for: .touchUpInside)
    }
    
    
    // MARK: - Button Actions
    @objc
    func didTapGreetingButton() {
        let greetingText = "Hello" + " " + self.person?.firstName + " " + self.person?.lastName
        greetingLabel.text = greetingText
    }
    
    // layout codes...
}


// MARK: - Run
let model = Person(firstName: "Cristiano", lastName: "Ronaldo")

let viewControleler = GreetingViewController()
viewControleler.person = model
