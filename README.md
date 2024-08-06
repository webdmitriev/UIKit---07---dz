# Error-Nil UIKit-07 DZ
 
```swift
private let tableProductData: [ProductData] = ProductData.mockData()

private lazy var tableView: UITableView = {
    $0.dataSource = self
    $0.delegate = self
    $0.separatorStyle = .none
    
    $0.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
    return $0
}(UITableView(frame: view.frame, style: .plain))
```

```swift
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableProductData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableProductData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell

        cell.setupView(item: item)
        cell.selectionStyle = .none
        
        return cell
    }
}
```
