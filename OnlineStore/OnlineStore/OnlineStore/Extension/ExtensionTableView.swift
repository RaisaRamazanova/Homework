//
//  ExtensionTableView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit

// MARK: - Extension UITableViewDelegate

extension ThirdViewController: UITableViewDelegate {

    // удаляем ячейку
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAllAction = UIContextualAction(style: .destructive, title: "Удалить все") { [self] _, _, complete in
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            deleteAllClothes(data: cellVM)
            complete(true)
        }

        let deleteOneClothesAction = UIContextualAction(style: .normal, title: "Удалить 1 шт.") { [self] _, _, complete in
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            editCount(data: cellVM)
            complete(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAllAction, deleteOneClothesAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }

    // размер ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController(forClothes: viewModel.getCellViewModel(at: indexPath))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - Extension UITableViewDataSource

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coreDataCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self), for: indexPath) as! CustomTableViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.transferCellData(cellVM)
        cell.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        return cell
    }
}
