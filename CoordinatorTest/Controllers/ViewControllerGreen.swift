//
//  ViewControllerGreen.swift
//  CoordinatorTest
//
//  Created by Vitaly Gromov on 14.04.2024.
//

import Foundation
import UIKit

class ViewControllerGreen: UIViewController {
    
    let coordinator: CoordinatorProtocol
    
    let toRedBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to red", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        return btn
    }()
    
    let toBlueBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to blue", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        return btn
    }()
    
    let stackView: UIStackView = UIStackView()

    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        print("green init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("green deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "GREEN"
        
        view.addSubview(stackView)
        stackView.frame = view.frame
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.addArrangedSubview(toRedBtn)
        stackView.addArrangedSubview(toBlueBtn)
        
        toRedBtn.addTarget(self, action: #selector(redFunc), for: .touchUpInside)
        toBlueBtn.addTarget(self, action: #selector(blueFunc), for: .touchUpInside)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    @objc func blueFunc() {
        coordinator.moveTo(destination: .blue)
        
    }
    
    @objc func redFunc() {
        coordinator.moveTo(destination: .red)
    }
    
    
}
