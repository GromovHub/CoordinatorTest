//
//  ViewControllerBlue.swift
//  CoordinatorTest
//
//  Created by Vitaly Gromov on 14.04.2024.
//

import Foundation
import UIKit

class ViewControllerBlue: UIViewController {
    
    let coordinator: CoordinatorProtocol
    
    let toRedBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to red", for: .normal)
        btn.setTitleColor(.yellow, for: .normal)
        return btn
    }()
    
    let stackView: UIStackView = UIStackView()

    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        print("blue init")
    }
    
    deinit {
        print("blue deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "BLUE"
        
        view.addSubview(stackView)
        stackView.frame = view.frame
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(toRedBtn)
        
        toRedBtn.addTarget(self, action: #selector(redFunc), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .yellow
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.yellow]
    }
    
    @objc func redFunc() {
        coordinator.moveTo(destination: .red)
    }
    
}
