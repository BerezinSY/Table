import UIKit

open class TableViewController<T: TableModel, Cell: TableViewCell<T.Item>>: UITableViewController {
    
    public var content: [T] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(Cell.nib, forCellReuseIdentifier: Cell.id)
    }
    
    // MARK: - Table view data source
    open override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        content[section].isShowHeader ? content[section].header : nil
    }
    
    open override func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content[section].items.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id, for: indexPath) as? Cell
        let item = content[indexPath.section].items[indexPath.row]
        cell?.item = item
        return cell ?? UITableViewCell()
    }
}
