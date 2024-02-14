import Foundation

enum ATTable {
    case product, schedule, faq, feedback, config
    
    var link: String {
        switch self {
        case .product:
            return Constants.baseUrl + Constants.productTableId
        case .schedule:
            return Constants.baseUrl + Constants.scheduleTableId
        case .faq:
            return Constants.baseUrl + Constants.faqsTableId
        case .feedback:
            return Constants.baseUrl + Constants.feedbackTableId
        case .config:
            return Constants.baseUrl + Constants.configTableId
        }
    }
    
    var bearerToken: String {
        switch self {
        case .product, .schedule, .faq, .config:
            return "Bearer \(Constants.readKey)"
        case .feedback:
            return "Bearer \(Constants.writeKey)"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .product, .schedule, .faq, .config:
            return "GET"
        case .feedback:
            return "POST"
        }
    }
}
