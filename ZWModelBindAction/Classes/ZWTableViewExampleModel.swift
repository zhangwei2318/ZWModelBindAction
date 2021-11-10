//
//  ZWTableViewExampleModel.swift
//  ZWTableViewExample
//
//  Created by 张伟 on 2021/11/3.
//

import UIKit

class ZWTableViewExampleModel: NSObject {
    var imgStr: String? // cell图片
    var title: String? // cell标题
    var content: String? // cell内容
    var isMore: Bool? // 是否显示更多
    
    /// 点击每行cell点击事件,传索引
    var itemClick : ((_ indexPath: IndexPath) -> ())?
    
    /// 将点击事件分离
    class func initModel(title: String?, imgStr: String?, content: String?, isMore: Bool?) -> ZWTableViewExampleModel{
        let item = ZWTableViewExampleModel()
        item.imgStr = imgStr
        item.title = title
        item.content = content
        item.isMore = isMore
        return item
    }
    /// 将点击事件合并
    class func initModel(title: String?, imgStr: String?, content: String?, isMore: Bool?, itemClick: ((_ indexPath: IndexPath) -> ())?) -> ZWTableViewExampleModel{
        let item = ZWTableViewExampleModel()
        item.imgStr = imgStr
        item.title = title
        item.content = content
        item.isMore = isMore
        item.itemClick = itemClick
        return item
    }
}
