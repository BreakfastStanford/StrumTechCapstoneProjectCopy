import Cocoa
import Foundation
//extensions add addtional functionality to an existing object

extension String
{
    
    mutating func trim() -> String
    {
        //https://www.slingacademy.com/article/swift-remove-leading-and-trailing-whitespace-of-a-string/
        var str = self
        let leadingWhitespace = str.prefix(while: {$0.isWhitespace})
        let trimmedStr = String(str[leadingWhitespace.endIndex...])
        str = trimmedStr
        let pattern = "\\s+$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(str.startIndex..., in: str)
        let trimmed = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: "")
        self = trimmed
        return self
    }
}

var quote = "   The truth is rarely pure and never simple   "
print(quote)

var trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines) //this seems to work when not inside the extension
let newstring = quote.trim()

print(trimmed)
print(newstring)


let lyrics = """
But I keep cruising
Cant stop, wont stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

// print(lyrics.lines.count)
let ns = lyrics as NSString
var i:Int = 0
ns.enumerateLines { (str, _) in
    print(str)
    i = i + 1
}

print(i)




/**
 https://stackoverflow.com/questions/46490920/count-the-number-of-lines-in-a-swift-string https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/
 
 extensions:
 make code easier write
 read
 and maintain
 
 also this code doesnt compile i guess
 https://www.youtube.com/watch?v=ALsr3hANqD0
 
 
 
 
 
 
 */


protocol whatever
{
    func doWhatever()
}

struct RandomSt
{
    var i: String = "Here is a string"
    
    func doThis()
    {
        print(i)
    }
    
}


var rs = RandomSt()
rs.doThis()

extension RandomSt: whatever
{
    func doWhatever()
    {
        print("Yea this is something")
    }
}

var rs2 = RandomSt()
rs2.doWhatever()

/*
 so extensions allow you to expand functionality on anytype from anywhere,
 not just the original source code
 
 in this case this is useful because we can expand the struct to adhere to the whatever protocol and
 implement the doWhatever method
 
 so this is what is happening in the view controller:
 the view controller is being extended to act as a delegate and use the
 CBCentralManagerDelegate protocol...which is then more than likely called by a framework object from the corebluetooh
 library
 
 extension ViewController: CBCentralManagerDelegate {

   func centralManagerDidUpdateState(_ central: CBCentralManager) {
     
      switch central.state {
           case .poweredOff:
               print("Is Powered Off.")
           case .poweredOn:
               print("Is Powered On.")
               startScanning()
           case .unsupported:
               print("Is Unsupported.")
           case .unauthorized:
           print("Is Unauthorized.")
           case .unknown:
               print("Unknown")
           case .resetting:
               print("Resetting")
           @unknown default:
             print("Error")
           }
   }
     
     // called after a peripheral is discovered
     func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,advertisementData: [String : Any], rssi RSSI: NSNumber) {
         
         bluefruitPeripheral = peripheral
         
         bluefruitPeripheral.delegate = self
         
         print("Peripheral Discovered: \(peripheral)")
         print("Peripheral name: \(peripheral.name!)")
         print ("Advertisement Data : \(advertisementData)")
         
         centralManager?.stopScan()
         centralManager?.connect(bluefruitPeripheral!, options: nil)
     }
     
     // called after a connection to a new peripheral
     // used to discover services for the peripheral
     func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral)
     {
        bluefruitPeripheral.discoverServices([CBUUIDs.BLEService_UUID])
     }
 }
 
 bluefruitPeripheral.delegate = self
// this is a point where we register the viewcontroller as a delegate
 
 - instantiate service
 - register ourselves as the delegate
 - call the method to order somework
 - work is completed and it calls the delegate in response to said completed work
 **/
