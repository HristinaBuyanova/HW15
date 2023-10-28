//
//  ViewController.swift
//  HW15
//
//  Created by Христина Буянова on 28.10.2023.
//

import UIKit

class MVCController: UIViewController {

    private var model = MVCModel.array
    private var mvcView: MVCView?

    override func loadView() {
        mvcView = MVCView()
        view = mvcView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configure() {
        mvcView?.tableView.register(StandartCell.self, forCellReuseIdentifier: StandartCell.identifier)
        mvcView?.tableView.register(CustomSwitchCell.self, forCellReuseIdentifier: CustomSwitchCell.identifier)
        mvcView?.tableView.register(CustomNotificationCell.self, forCellReuseIdentifier: CustomNotificationCell.identifier)
        mvcView?.tableView.dataSource = self
        mvcView?.tableView.delegate = self
    }
}

extension MVCController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let modelData = model[indexPath.section][indexPath.row]
        switch modelData.typeCell {
        case .standartType:
            let cell = tableView.dequeueReusableCell(withIdentifier: StandartCell.identifier, for: indexPath) as? StandartCell
            cell?.accessoryType = .disclosureIndicator
            cell?.model = modelData
            return cell ?? UITableViewCell()
        case .switchType:
            let switchCell = tableView.dequeueReusableCell(withIdentifier: CustomSwitchCell.identifier, for: indexPath) as? CustomSwitchCell
            switchCell?.model = modelData
            return switchCell ?? UITableViewCell()
        case .notificationType:
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: CustomNotificationCell.identifier, for: indexPath) as? CustomNotificationCell
            notificationCell?.accessoryType = .disclosureIndicator
            notificationCell?.model = modelData
            return notificationCell ?? UITableViewCell()
        }
    }
}

extension MVCController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modelData = model[indexPath.section][indexPath.row]
        print("Нажата ячейка \(modelData.title)")
        let viewController = DetailController()
        _ = viewController.view
        viewController.configureView(model: modelData)
        if modelData.typeCell != .switchType {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

