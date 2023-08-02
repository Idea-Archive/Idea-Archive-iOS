import Foundation

extension Bundle {
    var baseAPIKey: String {
        guard let file = self.path(forResource: "URLInfo", ofType: "plist") else { return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["Base-API-KEY"] as? String else {
            fatalError("BaseURLInfo.plist에API_KEY설정을해주세요.")
        }
        return key
    }
    
    var testAPIKey: String {
        guard let file = self.path(forResource: "URLInfo", ofType: "plist") else { return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["Test-API-KEY"] as? String else {
            fatalError("BaseURLInfo.plist에 API_KEY 설정을해주세요.")
        }
        return key
    }
    
}
