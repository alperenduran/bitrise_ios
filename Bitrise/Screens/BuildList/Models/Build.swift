//
//  Build.swift
//  Bitrise
//
//  Created by Alperen Duran on 16.11.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import Foundation
import SwiftUI

struct Build: Decodable, Identifiable {
    let id: String
    let triggeredAt: String
    let status: Status
    let statusName: String
    let branch: String
    let buildNumber: Int
    let workflow: String
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case triggeredAt = "triggered_at"
        case status
        case statusName = "status_text"
        case branch
        case buildNumber = "build_number"
        case workflow = "triggered_workflow"
        
    }
}
//MARK: -Date
extension Build {
    var startTime: String {
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatterGet.timeZone = .current
            
            let dateFormatterSet = DateFormatter()
            dateFormatterSet.dateFormat = "HH:mm"
        
            guard let date = dateFormatterGet.date(from: triggeredAt) else { return "" }
            let dateString = dateFormatterSet.string(from: date)

            return dateString
    }
}
//MARK: -Color
extension Build {
    var statusColor: Color {
        switch status {
        case .failed:
            return Color("failedRed")
        case .abortedWithFailure, .abortedWithSuccess:
            return Color("abortedYellow")
        case .inProgress:
            return Color("inProgressPurple")
        case .successful:
            return Color("successfulGreen")
        }
    }
}

//MARK: -Status
extension Build {
    var statusLabel: String {
        switch status {
        case .failed:
            return "Failed"
        case .abortedWithFailure, .abortedWithSuccess:
            return "Aborted"
        case .inProgress:
            return "In Progress"
        case .successful:
            return "Successful"
        }
    }
}
