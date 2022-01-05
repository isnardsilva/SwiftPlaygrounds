import UIKit

// MARK: - Model
struct Person {
    let firstName: String
    let lastName: String
}




// MARK: - Presenter
protocol GreetingView: AnyObject {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
    unowned let view: GreetingView
    let person: Person
    
    
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        view.setGreeting(greeting: greeting)
    }
}




// MARK: - View
class GreetingViewController: UIViewController, GreetingView {
    var presenter: GreetingPresenter!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showGreetingButton.addTarget(self, action: #selector(didTapGreetingButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapGreetingButton() {
        presenter.showGreeting()
    }
    
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
    
    // layout code goes here
}



// MARK: - Assembling of MVP
let model = Person(firstName: "Cristiano", lastName: "Ronaldo")
let view = GreetingViewController()
let presenter = GreetingPresenter(view: view, person: model)
view.presenter = presenter

