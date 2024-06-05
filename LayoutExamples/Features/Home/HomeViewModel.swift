//
//  HomeViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var items: [HomeModel.Item.Name] { get }
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var items: [HomeModel.Item.Name] {
        HomeModel.Item.Name.allCases
    }
}
