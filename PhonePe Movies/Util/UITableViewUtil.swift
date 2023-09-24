//
//  UITableViewUtil.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

import UIKit

extension UITableViewCell {
    @objc static var defaultIdentifier: String { String(describing: self) }
}

extension UITableView {
    
    func registerClassWithDefaultIdentifier(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: cellClass.defaultIdentifier)
    }
    
    func dequeueReusableCellWithDefaultIdentifier<T: UITableViewCell>() -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultIdentifier) as? T else {
            assertionFailure("Could not dequeue cell.")
            return nil
        }
        return cell
    }
    
}
