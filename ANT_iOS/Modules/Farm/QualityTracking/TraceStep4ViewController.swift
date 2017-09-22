//
//  TraceStep4ViewController.swift
//  ANT_iOS
//
//  Created by 宇玄丶 on 2017/9/19.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

class TraceStep4ViewController: BaseViewController {

    override func loadSubViews() {
        super.loadSubViews()
        titleLabel.text = "第四步"
        contentView.backgroundColor = UIColor.white
        
        rightBtn.isHidden = false
        rightBtn.setImage(UIImage.icon(with: TBCityIconInfo.init(text: "\u{e611}", size: 25, color: UIColor.black)), for: .normal)
        rightBtn.setImage(UIImage.icon(with: TBCityIconInfo.init(text: "\u{e611}", size: 25, color: UIColor.gray)), for: .highlighted)
        
        let traceStepView = TraceStepView(style: .default, reuseIdentifier: "")
        traceStepView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 220)
        traceStepView.centerX = view.centerX
        
        let stepData = StepGuideModel()
        stepData.server_name = "小陌"
        stepData.server_image = ""
        stepData.step_title = "挑一张好看的农产品图片，展示出来吧"
        traceStepView.stepData = stepData
        contentView.addSubview(traceStepView)
    }
    
    override func layoutConstraints() {
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { (make) in
            make.top.equalTo(290)
            make.centerX.equalTo(view)
            make.width.height.equalTo(160)
        }
        
        contentView.addSubview(nextStepkBtn)
        nextStepkBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.bottom.equalTo(view).offset(-40)
            make.height.equalTo(44)
        }
    }
    
    override func rightBtnAction() {
        let alertView = YYAlertView()
        alertView.initWithTitle(titles: "退出后已经填写的信息将不会被保存，确定要退出吗？", message: "", sureTitle: "确定", cancleTitle: "取消")
        alertView.alertSelectIndex = { (index) -> Void in
            if index == 2 {
                self.dismiss(animated: true, completion: nil)
            }
        }
        alertView.showAlertView()
    }
    
    func nextStepkBtnAction() {
        let step5 = TraceStep5ViewController()
        self.navigationController?.pushViewController(step5, animated: true)
    }
    
    func tapAction() {
        
    }
    
    lazy var productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.contentMode = .scaleAspectFill
        productImage.kf.setImage(with: nil, placeholder: IMAGE_PLACEHOLDER, options: nil, progressBlock: nil, completionHandler: nil)
        productImage.layer.cornerRadius = 80
        productImage.clipsToBounds = true
        productImage.layer.borderColor = BaseColor.LineColor.cgColor
        productImage.layer.borderWidth = 0.5
        productImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        productImage.addGestureRecognizer(tapGesture)
        return productImage
    }()
    
    lazy var nextStepkBtn: UIButton = {
        let nextStepkBtn = UIButton(type: UIButtonType.custom)
        nextStepkBtn.setTitle("下一步", for: .normal)
        nextStepkBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nextStepkBtn.setTitleColor(UIColor.white, for: .normal)
        nextStepkBtn.setTitleColor(BaseColor.GrayColor, for: .highlighted)
        nextStepkBtn.backgroundColor = BaseColor.ThemeColor
        nextStepkBtn.layer.cornerRadius = 5
        nextStepkBtn.clipsToBounds = true
        nextStepkBtn.addTarget(self, action: #selector(nextStepkBtnAction), for: .touchUpInside)
        return nextStepkBtn
    }()
}