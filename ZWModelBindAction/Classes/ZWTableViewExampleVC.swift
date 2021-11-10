//
//  ZWTableViewExampleVC.swift
//  ZWTableViewExample
//
//  Created by 张伟 on 2021/11/3.
//

import UIKit
/// 元组
typealias ExampleItem = (title: String?, imgStr: String?, content: String?, isMore: Bool?, itemClick: ((_ indexPath: IndexPath) -> Void)?)

class ZWTableViewExampleVC: UIViewController {
    var modelData = [[ZWTableViewExampleModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "优雅的tableview"
        view.addSubview(tableView)
        setModelDataValue()
        
    }
    
    /// 初始化数据
    private func setModelDataValue() {
        /// 第0组
        /// 点击事件分离写法
        let model0_0 = ZWTableViewExampleModel.initModel(title: "分类", imgStr: "fenlei", content: nil, isMore: true)
        model0_0.itemClick = { indexPath in
            print("点击了分类")
        }
        /// 点击事件合并写法
        let model0_1 = ZWTableViewExampleModel.initModel(title: "我的课表", imgStr: "kebiao", content: nil, isMore: true) { indexPath in
            print("点击了我的课表")
        }
        
        /// 第1组
        let model1_0 = ZWTableViewExampleModel.initModel(title: "我的余额", imgStr: "qianbao", content: nil, isMore: true) { indexPath in
            print("点击了我的余额")
        }
        
        let model1_1 = ZWTableViewExampleModel.initModel(title: "消息", imgStr: "xiaoxi", content: nil, isMore: true) { indexPath in
            print("点击了消息")
        }
        
        /// 第2组
        let model2_0 = ZWTableViewExampleModel.initModel(title: "当前版本", imgStr: "lishi", content: "1.2.1", isMore: false) { indexPath in
            
        }
        
        /**
         无点击事件也可以这样写
        let model2_0 = ZWTableViewExampleModel.initModel(title: "当前版本", imgStr: "lishi", content: "lishi", isMore: false, itemClick: nil)
         
        let model2_0 = ZWTableViewExampleModel.initModel(title: "当前版本", imgStr: "lishi", content: "lishi", isMore: false)   
         */
        
        modelData = [
                    [model0_0, model0_1],
                    [model1_0, model1_1],
                    [model2_0]
                    ]
        /**
         元组写法
         let item: ExampleItem = (title: "当前版本", imgStr: "lishi", content: "1.2.1", isMore: false, itemClick: { indexPath in
             
         })
         modelData = [[item]]
         */
    }
    
    
    private lazy var tableView: UITableView = {
        let tableV = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
        tableV.backgroundColor = .white
        tableV.delegate = self
        tableV.dataSource = self
        tableV.rowHeight = 50
        tableV.tableFooterView = UITableViewHeaderFooterView.init()
//        tableV.register(cellType: YXWalletCell.self)
        
        /// iOS 15 的 UITableView又新增了一个新属性：sectionHeaderTopPadding 会给每一个section header 增加一个默认高度，当我们 使用 UITableViewStylePlain 初始化 UITableView的时候，就会发现，系统给section header增高了22像素。
        /// 去除默认高度
        if #available(iOS 15.0, *) {
            tableV.sectionHeaderTopPadding = 0
        }
        return tableV
    }()

}

extension ZWTableViewExampleVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ZWTableViewExampleCell.cellWithTableView(tableView)
        cell.model = modelData[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = modelData[indexPath.section][indexPath.row]
        guard let click = model.itemClick else {
            return
        }
        click(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 15))
        view.backgroundColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 15))
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}
