
import UIKit

public class AsciiNumber : NSObject{

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

