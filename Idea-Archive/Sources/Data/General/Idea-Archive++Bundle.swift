import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "BaseURLInfo", ofType: "plist") else { return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else {
            fatalError("BaseURLInfo.plist에API_KEY설정을해주세요.")
        }
        return key
    }
}
