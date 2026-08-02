//
//  BluetoothViewController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/21/23.
//

import UIKit
import CoreBluetooth

class ChordPageViewController: BLEViewControllerBase
{
    var defaultColor: UIColor? = nil
    var pushedColor : UIColor? = nil
    var lastChord : String = ""
    
    @IBOutlet weak var c: UIButton!
    
    
    @IBOutlet weak var cs: UIButton!
    
    
    @IBOutlet weak var d: UIButton!
    
    
    @IBOutlet weak var ds: UIButton!
    
    
    
    
    @IBOutlet weak var e: UIButton!
    
    
    @IBOutlet weak var f: UIButton!
    
 
    @IBOutlet weak var fs: UIButton!
    
    
    @IBOutlet weak var g: UIButton!
    
    @IBOutlet weak var gs: UIButton!
    

    @IBOutlet weak var a: UIButton!
    
   
    @IBOutlet weak var asc: UIButton!
    
    
    @IBOutlet weak var b: UIButton!
    
    
    
    
    @IBAction func DMajor(_ sender: UIButton)
    {
        SendChord("D")
    }
    @IBAction func CSharpMajor(_ sender: UIButton) 
    {
        SendChord("Db")
    }
    
    @IBAction func cmajor(_ sender: UIButton) 
    {
        SendChord("C")
    }
    
    
    @IBAction func DSharpMajor(_ sender: UIButton) 
    {
        SendChord("Eb")
    }
    
    
    @IBAction func Emajor(_ sender: UIButton)
    {
        SendChord("E")
    }
    
    
    @IBAction func Fmajor(_ sender: UIButton) 
    {
        SendChord("F")
    }
    
    
    @IBAction func Gmajor(_ sender: UIButton)
    {
        SendChord("G")
    }
    @IBAction func FSharpMajor(_ sender: UIButton)
    {
        SendChord("Gb")
    }
    
    @IBAction func BMajor(_ sender: UIButton)
    {
        SendChord("B")
    }
    @IBAction func ASharpMajor(_ sender: UIButton) 
    {
        SendChord("Bb")
    }
    
    @IBAction func GSharpMajor(_ sender: UIButton)
    {
        SendChord("Ab")
    }
    
    @IBAction func Amajor(_ sender: UIButton) 
    {
        SendChord("A")
    }
    
    
    
    
    /************MINOR CHORDS**/
    @IBAction func Cminor(_ sender: UIButton)
    {
        SendChord("Cm")
    }
    
    @IBAction func CSharpminor(_ sender: UIButton)
    {
        SendChord("Dbm")
    }
    
    @IBAction func Dminor(_ sender: UIButton)
    {
        SendChord("Dm")
    }
    
    @IBAction func DSharpminor(_ sender: UIButton)
    {
        SendChord("Ebm")
    }
    
    @IBAction func Eminor(_ sender: UIButton)
    {
        SendChord("Em")
    }
    
    @IBAction func Fminor(_ sender: UIButton)
    {
        SendChord("Fm")
    }
    
    @IBAction func FSharpminor(_ sender: UIButton)
    {
        SendChord("Gbm")
    }
    
    @IBAction func Gminor(_ sender: UIButton)
    {
        SendChord("Gm")
    }
    
    @IBAction func GSharpminor(_ sender: UIButton)
    {
        SendChord("Abm")
    }
    
    @IBAction func Aminor(_ sender: UIButton)
    {
        SendChord("Am")
    }
    
    @IBAction func ASharpminor(_ sender: UIButton)
    {
        SendChord("Bbm")
    }
    
    @IBAction func Bminor(_ sender: UIButton)
    {
        SendChord("Bm")
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        defaultColor = c.backgroundColor
    }
    

    //helper
    func SendChord(_ chord : String)
    {
        if(bleObject != nil)
        {
           // SetButtonColor(<#T##name: String##String#>, CompareButtonNames())
            print("Chord Sent: " + chord);
            bleObject!.sendStringDataOverBluetooth(chord, (bleObject?.chordCharacteristic)!, false)
        }
    }
    
    override func SetDefaultGuitarMode() -> GuitarModeEnum {
        return .chord
    }
    
    // currently not used
    func CompareButtonNames(_ name: String) -> Int
    {
        if (name == lastChord)
        {
            return 0
        }
        else
        {
            lastChord = name
            return 1
        }
        
        
    }
    
    // currently not used
    func SetButtonColor(_ name: String, _ active: Int)
    {
        
        // major buttons
        
        let majorSubviews = majorview.subviews

        // Filter the subviews to only get those that are UIButton instances
        let MajorButtons = majorSubviews.compactMap { $0 as? UIButton }
        
        // Assuming you have an array of buttons named `allButtons`
        for button in MajorButtons
        {
            if (button.currentTitle == name && active == 1)
            {
                button.backgroundColor = pushedColor
                continue
            }
               
            button.backgroundColor = defaultColor
        
        }
        
        
        //minor buttons
        let minorSubviews = majorview.subviews

        // Filter the subviews to only get those that are UIButton instances
        let minorButtons = minorSubviews.compactMap { $0 as? UIButton }
        
        // Assuming you have an array of buttons named `allButtons`
        for button in minorButtons
        {
            if (button.currentTitle == name && active == 1)
            {
                button.backgroundColor = pushedColor
                continue
            }
               
            button.backgroundColor = defaultColor
        
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        lastChord = ""
        SetButtonColor("", 0)
        
      
        
    }
    /*
    override func viewDidDisappear(_ animated: Bool) {
        SetButtonColor("", 0)
        lastChord = 0
    }
     */
    @IBOutlet weak var majorview: UIView!
    
    @IBOutlet weak var minorview: UIView!
}
    







