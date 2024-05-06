//
//  WalletController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

class WalletController: UIViewController {
    
    // MARK: - Private properties
    
    private var viewModel: WalletViewModelProtocol?
    private var contentView: WalletViewProtocol?
    
    // MARK: - Init
    
    init(viewModel: WalletViewModelProtocol, contentView: WalletViewProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.contentView = contentView
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        
    }
    
    private func bind() {
        
    }
}
