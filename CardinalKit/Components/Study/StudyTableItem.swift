//
//  StudyTableItem.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit

enum StudyTableItem: Int {
    
    static var allValues: [StudyTableItem] {
        var index = 0
        return Array (
            AnyIterator {
                let returnedElement = self.init(rawValue: index)
                index = index + 1
                return returnedElement
            }
        )
    }

    // table items
    case survey

    var task: ORKOrderedTask {
        switch self {
        case .survey:
            return StudyTasks.FinalTask
        }
    }

    var title: String {
        switch self {
        case .survey:
            return "Start a New Study"
        
        }
    }

    var subtitle: String {
        switch self {
        case .survey:
            return "Input New Data"
        
        }
    }

    var image: UIImage? {
        switch self {
        case .survey:
            return UIImage(named: "SurveyIcon")
    
        }
    }
}
    
//    case coffee
//
//    var task: ORKOrderedTask {
//        switch self {
//        case .coffee:
//            return StudyTasks.coffeeTask
//        }
//    }
//
//    var title: String {
//        switch self {
//        case .coffee:
//            return "Coffee Task"
//        }
//    }
//
//    var subtitle: String {
//        switch self {
//        case .coffee:
//            return "Record your coffee intake for the day."
//        }
//    }
//
//    var image: UIImage? {
//        switch self {
//        case .coffee:
//            return UIImage(named: "CoffeeIcon")
//        }
//    }
//}
