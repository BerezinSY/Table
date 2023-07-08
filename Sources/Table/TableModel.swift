public protocol TableModel {
    associatedtype Item
    
    var items: [Item] { get }
    var header: String { get }
    var isShowHeader: Bool { get }
}
