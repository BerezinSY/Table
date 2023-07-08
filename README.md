# Table

A description of this package.

1. Make import the library (import Table) in your file
2. Create subclasses of TableViewCell and TableViewController
3. Create a model struct and subscribe the model to TableModel protocol
4. Place TableViewCell subclass in type placeholder of TableViewController
5. Place the model struct in type placeholder of TableViewCell and TableViewController

Example:

//-//-//-//-//-//-//-//-//-//-Create model-//-//-//-//-//-//-//-//-//-//-//-//-
struct Model: TableModel {
    var header: String
    var items: [String]
    var isShowHeader: Bool
}


//-//-//-//-//-//-//-//-//-//-Create cell-//-//-//-//-//-//-//-//-//-//-//-//-
class Cell: TableViewCell<String> {

    @IBOutlet private var label: UILabel?
    
    override var item: String? {
        didSet {
            label?.text = item
        }
    }
}


//-//-//-//-//-//-//-//-//-//-Create controller-//-//-//-//-//-//-//-//-//-//-
class Controller: TableViewController<Model, Cell> {}



//-//-//-//-//-//-//-//-//-//-Launch table-//-//-//-//-//-//-//-//-//-//-//-//-
In SceneDelegate file make code:

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let scene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: scene)
    let vc = Controller()
    vc.content = [
    Model(header: "Header 1", items: ["1", "2", "3", "4", "5", ], isShowHeader: true),
    Model(header: "Header 2", items: ["1", "2", "3", "4", "5", ], isShowHeader: false),
    Model(header: "Header 3", items: ["1", "2", "3", "4", "5", ], isShowHeader: true),
    ]
    window.rootViewController = vc
    window.makeKeyAndVisible()
    self.window = window
}
