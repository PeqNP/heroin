/**
 NOTE: The first view controller can not inject dependencies as it is loaded _before_ application:willFinishLaunchingWithOptions:. In other words, the containers have not yet been registered using di_register(containers:).

 You may be able to get around this by subclassing the init methods.
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let cl = MyClass()
    }
}

