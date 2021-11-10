//
//  ZWTableViewExampleCell.swift
//  ZWTableViewExample
//
//  Created by 张伟 on 2021/11/3.
//

import UIKit

class ZWTableViewExampleCell: UITableViewCell {
    var model: ZWTableViewExampleModel? {
        didSet {
            titleL.text = model?.title
            contentL.text = model?.content
            imgV.image = UIImage.init(named: model?.imgStr ?? "")
            moreImgV.isHidden = !(model?.isMore ?? true)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    ///  创建代码写到Cell里,尽可能减少VC的体积
    class func cellWithTableView(_ tableView: UITableView) -> ZWTableViewExampleCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self)) as? ZWTableViewExampleCell
        if cell == nil {
            cell = ZWTableViewExampleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: NSStringFromClass(self))
        }
        return cell!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(imgV)
        addSubview(titleL)
        addSubview(contentL)
        addSubview(moreImgV)
    }
    
    private lazy var imgV:UIImageView = {
        let imgV = UIImageView.init(frame: CGRect.init(x: 15, y: 15, width: 20, height: 20))
        return imgV
    }()
    
    private lazy var titleL:UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 45, y: 0, width: 200, height: 50))
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var contentL:UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: UIScreen.main.bounds.width - 150 - 15, y: 0, width: 150, height: 50))
        label.textAlignment = .right
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var moreImgV:UIImageView = {
        let imgV = UIImageView.init(frame: CGRect.init(x: UIScreen.main.bounds.width - 20 - 15, y: 15, width: 20, height: 20))
        imgV.image = UIImage.init(named: "more")
        return imgV
    }()
}
