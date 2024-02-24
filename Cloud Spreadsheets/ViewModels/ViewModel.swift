import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var products = [ProductFields]()
    @Published var schedules = [ScheduleFields]()
    @Published var faqs = [FaqFields]()
    @Published var config = [ConfigFields]()
    
    func fetchProducts() async {
        guard let result: ProductRecords = await WebService().fetchDataFrom(from: .product) else {return}
        
        await fetchConfig()
        
        products = result.records.map(\.fields).sorted {$0.price > $1.price}
    }
    
    func fetchSchedules() async {
        guard let result: ScheduleRecords = await WebService().fetchDataFrom(from: .schedule) else {return}
        
        schedules = result.records.map(\.fields).sorted {$0.talkDate < $1.talkDate}
    }
    
    func fetchFaqs() async {
        guard let result: FaqRecords = await WebService().fetchDataFrom(from: .faq) else {return}
        
        faqs = result.records.map(\.fields).sorted {$0.order < $1.order}
    }
    
    func sendFeedback(feedback: FeedbackFields) {
        let records = FeedbackRecords(
            records: [
                FeedbackRecord(
                    id: nil,
                    createdTime: nil,
                    fields: feedback
                )]
        )
        
        Task {
            await WebService().create(records)
        }
    }
    
    func fetchConfig() async {
        guard let result: ConfigRecords = await WebService().fetchDataFrom(from: .config) else {return}
        
        config = result.records.map(\.fields)
    }
}
