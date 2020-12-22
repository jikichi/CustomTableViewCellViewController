//
//  ViewModel.swift
//  SampleRxDatasources
//
//  Created by jikichi on 2020/12/22.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class ViewModel {
    let sections: Observable<[MultipleSectionModel]> = Observable<[MultipleSectionModel]>.of([
        .ImageProvidableSection(title: "Section1", items: [.ImageSectionItem(image: UIImage(named: "settings")!, title: "General"), .ImageSectionItem(image: UIImage(named: "settings")!, title: "general")]),
        .ToggleableSection(title: "Sectino2", items: [.ToggleableSectionItem(title: "On", enabled: true)]),
        .StepperableSection(title: "Section3", items: [.StepperSectionItem(title: "1")])
    ])
}
