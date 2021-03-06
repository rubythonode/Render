import UIKit
import Render

class Example3ViewController: UIViewController {

  let scrollableComponent = ScrollableDemoComponentView()

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = Color.black
    self.view.addSubview(scrollableComponent)
    generateRandomStates()
  }

  func generateRandomStates() {
    scrollableComponent.state = FooCollectionState()
    scrollableComponent.render(in: self.view.bounds.size)

    self.title = "EXAMPLE 3 (\(scrollableComponent.state!.foos.count) elements)"

    // Generates a new random state every 2 seconds.
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.generateRandomStates()
    }
  }

  override func viewDidLayoutSubviews() {
    scrollableComponent.render(in: self.view.bounds.size)
  }
}

