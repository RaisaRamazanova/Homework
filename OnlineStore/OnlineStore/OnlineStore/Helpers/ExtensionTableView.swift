//
//  ExtensionTableView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit

// MARK: - Extension
extension ThirdViewController:  UITableViewDelegate {
    // удаляем ячейку
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, complete in
//            CitiesJson.shared.removeCity(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            complete(true)
//        }
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        configuration.performsFirstActionWithFullSwipe = true
//        return configuration
//    }
    
    // размер ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    //функция запускается при нажатии на ячейку и открывает подробный экран
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if !tableView.isEditing {
//            lastTimeSelectedRowIndexPath = indexPath
//            let city = cities.list[indexPath.row]
//            let vc = DetailViewController(forCity: city)
//            navigationController?.pushViewController(vc, animated: true)
//        } else if tableView.indexPathsForSelectedRows != nil {
//            navigationItem.leftBarButtonItem?.isEnabled = true
//        }
//    }
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coreDataCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self), for: indexPath) as! CustomTableViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.backgroundColor = .white
        return cell
    }
}
