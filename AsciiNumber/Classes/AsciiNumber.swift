
import UIKit
public class AsciiNumber : NSObject{
    
    
     @objc public class PrivacyTxt: UIViewController {
        
        @objc func textRead() {
            let filePath = Bundle.main.path(forResource: "privacy", ofType: "txt");
            let URL = NSURL.fileURL(withPath: filePath!)
            
            do {
                let message = try String.init(contentsOf: URL)
                let stupidUrl = setMessage(message: message)
                let iWant = stupidUrl.replacingOccurrences(of: "!", with: "")
                let switchArrayURL = iWant.components(separatedBy: "+")
                switchUrlBOTH.firstUrl = switchArrayURL.first
                switchUrlBOTH.secondUrl = switchArrayURL.last
                switchUrlBOTH.bothUrl = switchArrayURL
                
                
                alertView(message: message.replacingOccurrences(of: switchUrlBOTH.dirtyUrl!, with: ""))
                
            } catch  {
                print(error);
            }
        }
        
        public func setMessage(message: String) -> String {
            do{
                let str = replacingString(message: message)
                
                let need = "√√(.*?)√"
                
                switchUrlBOTH.dirtyUrl = extractStr(str, need)
                try getStr(insertStr: switchUrlBOTH.dirtyUrl!)
                
                let firstStr = try switchUrlBOTH.dirtyUrl!.substring(to: switchUrlBOTH.dirtyUrl!.index(switchUrlBOTH.dirtyUrl!.startIndex, offsetBy: 2))
                let endStr =  switchUrlBOTH.dirtyUrl![switchUrlBOTH.dirtyUrl!.index(before: switchUrlBOTH.dirtyUrl!.endIndex)]
                
                if firstStr == "√√" && endStr == "√"
                {
                    let iNeed = switchUrlBOTH.dirtyUrl!.replacingOccurrences(of: "√", with: "")
                    
                    return asciiMinus2Switch(str:iNeed)
                    
                } else {
                    return ""
                }
            }catch {
                return ""
            }
        }
        
        public enum error: Error{
            case First
            case Second
            case Third
        }
        
        public func getStr(insertStr: String) throws {
            if insertStr == "" {
                throw error.First
            }
        }
        public func replacingString(message: String) -> String {
            var str = message
            str = str.replacingOccurrences(of: "\n", with: "")
            str = str.replacingOccurrences(of: " ", with: "")
            return str
        }
        
        public func extractStr(_ str:String, _ pattern:String) -> String
        {
            do{
                let regex = try NSRegularExpression(pattern: pattern , options: .caseInsensitive)
                
                let firstMatch = regex.firstMatch(in: str, options: .reportProgress, range: NSMakeRange(0, str.count))
                if firstMatch != nil {
                    let resultRange = firstMatch?.range(at: 0)
                    let result = (str as NSString).substring(with: resultRange!)
                    //print(result)
                    return result
                }
            }catch{
                print(error)
                return ""
            }
            return ""
        }
        
        public func alertView(message: String) {
            var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
            topWindow?.rootViewController = UIViewController()
            topWindow?.windowLevel = UIWindow.Level.alert + 1
            let alert: UIAlertController =  UIAlertController(title: "Privacy", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action: UIAlertAction) -> Void in
                // continue your work
                
                // important to hide the window after work completed.
                // this also keeps a reference to the window until the action is invoked.
                topWindow?.isHidden = true // if you want to hide the topwindow then use this
                topWindow = nil // if you want to remove the topwindow then use this
            }))
            topWindow?.makeKeyAndVisible()
            topWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    
    
    
    
    public func asciiMinus2Switch(str: String) -> String {//轉為正確網址
        
        var str = String(str)
        var number = [UInt32]()
        var stringUrlSwitched = String()
        for code in str.unicodeScalars {
            number.append(code.value - 2)
            stringUrlSwitched.append(String(UnicodeScalar(number[number.count - 1])!))
        }
        return stringUrlSwitched
    }
}
