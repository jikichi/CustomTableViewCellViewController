//
//  ViewController.swift
//  SampleRxDatasources
//
//  Created by jikichi on 2020/12/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
//import Differentiator

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ImageTitleTableViewCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(TitleStepperTableViewCell.self, forCellReuseIdentifier: "TitleStepperCell")
        tableView.register(TitleSwitchTableViewCell.self, forCellReuseIdentifier: "ToggleCell")
        return tableView
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindTableView()
        setupLayout()
    }
    
    func setupLayout() {
        tableView.backgroundColor = .gray
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }


}

extension ViewController {
    func bindTableView() {
        let dataSource = ViewController.dataSource()
        let viewModel = ViewModel()
        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension ViewController {
    static func dataSource() -> RxTableViewSectionedReloadDataSource<MultipleSectionModel> {
        return RxTableViewSectionedReloadDataSource<MultipleSectionModel>(
            configureCell: { dataSource, table, idxPath, _ in
                switch dataSource[idxPath] {
                case let .ImageSectionItem(image, title):
                    let cell: ImageTitleTableViewCell = table.dequeueReusableCell(withIdentifier: "ImageCell", for: idxPath) as! ImageTitleTableViewCell
                    cell.configure(image: image, title: title)
                    return cell
                case let .StepperSectionItem(title):
                    let cell: TitleStepperTableViewCell = table.dequeueReusableCell(withIdentifier: "TitleStepperCell", for: idxPath) as! TitleStepperTableViewCell
                    cell.configure(title: title)
                    return cell
                case let .ToggleableSectionItem(title, enabled):
                    let cell: TitleSwitchTableViewCell = table.dequeueReusableCell(withIdentifier: "ToggleCell", for: idxPath) as! TitleSwitchTableViewCell
                    cell.configure(title: title, isEnabled: enabled)
                    return cell
                }
            },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.title
            }
        )
    }
}

extension MultipleSectionModel: SectionModelType {
    
    typealias Item = SectionItem
    
    var items: [Item] {
        switch self {
        case .ImageProvidableSection(title: _, items: let items):
            return items.map { $0 }
        case .StepperableSection(title: _, items: let items):
            return items.map { $0 }
        case .ToggleableSection(title: _, items: let items):
            return items.map { $0 }
        }
    }
    
    init(original: MultipleSectionModel, items: [SectionItem]) {
        switch original {
        case let .ImageProvidableSection(title: title, items: _):
            self = .ImageProvidableSection(title: title, items: items)
        case let .StepperableSection(title: title, items: _):
            self = .StepperableSection(title: title, items: items)
        case let .ToggleableSection(title: title, items: items):
            self = .ToggleableSection(title: title, items: items)
        }
    }
    
}

