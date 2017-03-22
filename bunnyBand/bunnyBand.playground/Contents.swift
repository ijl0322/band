
import UIKit
import PlaygroundSupport

/// View Controller to hold our view
class PlaygroundViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 100, y: 0, width: 800, height: 600)
        self.view.backgroundColor = .lightGray
        let editingPannel = EditPannel()
        self.view.addSubview(editingPannel)
    }
}

// Create an instance of the view controller
let viewController = PlaygroundViewController()

// Allow playground to execute

viewController.preferredContentSize = viewController.view.frame.size
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController.view
