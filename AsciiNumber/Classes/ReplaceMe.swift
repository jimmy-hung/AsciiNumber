

public class AsciiNumber : NSObject{
    
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
