import UIKit

open class TableViewCell<T>: UITableViewCell {
    
    class var id: String { String(describing: Self.self) }
    class var nib: UINib { UINib(nibName: Self.id, bundle: nil) }
    
    open var item: T?
}
