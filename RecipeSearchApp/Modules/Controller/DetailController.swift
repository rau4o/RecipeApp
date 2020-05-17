//
//  DetailController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import AnchoredBottomSheet

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    var detailView = DetailView(frame: UIScreen.main.bounds)
    static let shared = DetailController()
    
    private lazy var bottomSheetView: BottomSheetView = {
        let config = BottomSheetViewConfiguration(contentView: UIView(),
                                                  parentViewController: self,
                                                  defaultPosition: .middle(),
                                                  positions: [.top(), .middle()],
                                                  isSlidingToAppear: false,
                                                  isPullIndicatorNeeded: true,
                                                  isCloseButtonNeeded: true,
                                                  isDismissAllowed: false)
        let view = BottomSheetView(configuration: config)
        view.delegate = self as? BottomSheetViewDelegate
        return view
    }()
    
    lazy var additionalLabel: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 15, weight: .medium))
        text.sizeToFit()
        return text
    }()
    
    private let upImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "up")
        return image
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        initialSetup()
        activateViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.bottomSheetView.didSetupConstraints = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Helper function
    
    private func activateViewModel() {
        detailView.dismissAction = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }
        
//        detailView.showRecipeAction = { [weak self] in
//            guard let self = self else { return }
//            self.bottomSheetView.didSetupConstraints = true
//        }
    }
}

extension DetailController {
    
    func initialSetup() {
        view.backgroundColor = .white
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(detailView)
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(additionalLabel)
        bottomSheetView.addSubview(upImage)
        
        bottomSheetView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0)
        }
        
        detailView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        upImage.anchor(top: bottomSheetView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 50, height: 40)
        upImage.centerX(inView: bottomSheetView)
        
        additionalLabel.anchor(top: upImage.bottomAnchor, left: bottomSheetView.leftAnchor, bottom: bottomSheetView.bottomAnchor, right: bottomSheetView.rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
}
