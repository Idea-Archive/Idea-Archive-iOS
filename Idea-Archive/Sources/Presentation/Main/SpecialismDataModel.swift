import UIKit

struct SpecialismDataModel {
    enum DataModelType: String {
        case one
        case two
        case three
        case four
        case five
        case six
//        case frontEnd
//        case backEnd
//        case android
//        case iOS
//        case design
//        case 게임개발
//        case AI
//        case php
//        case cloud
//        case DBA
//        case webPublisher
//        case embedded
    }
    
    let type: DataModelType
    
    var name: String {
        return type.rawValue
    }
    
    var image: UIImage {
        switch type {
        case .one: return UIImage(systemName: "plus")!
        case .two: return UIImage(systemName: "minus")!
        case .three: return UIImage(systemName: "circle")!
        case .four: return UIImage(systemName: "square")!
        case .five: return UIImage(systemName: "app")!
        case .six: return UIImage(systemName: "oval")!
        }
    }
}

struct Mocks {
    static func getDataSource() -> [SpecialismDataModel] {
        return [SpecialismDataModel(type: .one),
                SpecialismDataModel(type: .two),
                SpecialismDataModel(type: .three),
                SpecialismDataModel(type: .four),
                SpecialismDataModel(type: .five),
                SpecialismDataModel(type: .six)]
    }
}
