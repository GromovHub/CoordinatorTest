//
//  ViewControllerRed.swift
//  CoordinatorTest
//
//  Created by Vitaly Gromov on 14.04.2024.
//

import UIKit

class ViewControllerRed: UIViewController {

    let coordinator: CoordinatorProtocol
    
    let toBlueBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to blue", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    let toGreenBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to green", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    let stackView: UIStackView = UIStackView()
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        print("red init")
    }
    
    deinit {
        print("red deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(stackView)
        
        self.title = "RED"
        
        stackView.frame = view.frame
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(toGreenBtn)
        stackView.addArrangedSubview(toBlueBtn)
        
        toGreenBtn.addTarget(self, action: #selector(greenFunc), for: .touchUpInside)
        toBlueBtn.addTarget(self, action: #selector(blueFunc), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    @objc func greenFunc() {
        coordinator.moveTo(destination: .green)
    }
    
    @objc func blueFunc() {
        coordinator.moveTo(destination: .blue)
    }

}

