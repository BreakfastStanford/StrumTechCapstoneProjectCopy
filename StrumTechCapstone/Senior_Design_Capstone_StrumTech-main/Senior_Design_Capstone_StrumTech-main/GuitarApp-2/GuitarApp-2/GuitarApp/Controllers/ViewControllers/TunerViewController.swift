//
//  TunerViewController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/26/23.
//

import UIKit

class TunerViewController: BLEViewControllerBase {
    
    @IBOutlet weak var TunerNote: UILabel!
    
    @IBOutlet weak var TunerFrequency: UILabel!
    
    @IBOutlet weak var TopRed: UIView!
    
    @IBOutlet weak var TopYellow: UIView!
    
    @IBOutlet weak var Green: UIView!
    
    @IBOutlet weak var BotYellow: UIView!
    
    @IBOutlet weak var BotRed: UIView!
    
    //https://reintech.io/blog/how-to-work-with-json-in-swift#
    struct TunerData: Codable
    {
        var number: Float
        var note: String
        var color: String
        
    }
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
    }
    
    
    // this should probably be called on a timer??
    // or when written to
    func UpdateTunerUI()
    {
        print("Update tuner called")
        var tunerData : TunerData? = nil

        let jsonData = bleObject!.tunerJsonCharacteristic!.value
        print("\( bleObject!.tunerJsonCharacteristic!.valueConverted)")
        do {
            tunerData = try JSONDecoder().decode(TunerData.self, from: jsonData ?? Data()) // Use person here
        }
        catch
        {
            print("Failed to decode JSON: \(error)")
            
        }
    
        TunerNote.text = tunerData?.note ?? "No Note"
        TunerFrequency.text = String(format: "%.2f", tunerData?.number ?? 0.0)
        DisplayColor(tunerData?.color ?? "GREEN")
        
        
    }
    
    func convertToString<T>(_ value: T) -> String {
        return "\(value)"
    }
    
    override func SetDefaultGuitarMode() -> GuitarModeEnum {
        return .tuner
    }
    
    
    override func transitionCleanup() 
    {
        super.transitionCleanup()
    }
    
    override func OnReadValueUpdated() 
    {
        UpdateTunerUI()
    }
    
    private func DisplayColor(_ color: String)
    {
        let gr = "GREEN"
        let tr = "HIGH RED"
        let ty = "HIGH YELLOW"
        let br = "LOW RED"
        let by = "LOW YELLOW"
        
        if(color == gr)
        {
            TopRed.isHidden = true
            BotRed.isHidden = true
            Green.isHidden = false
            TopYellow.isHidden = true
            BotYellow.isHidden = true
        }
        
        else if(color == tr)
        {
            TopRed.isHidden = false
            BotRed.isHidden = true
            Green.isHidden = true
            TopYellow.isHidden = true
            BotYellow.isHidden = true
            
        }
        
        else if(color == ty)
        {
            TopRed.isHidden = true
            BotRed.isHidden = true
            Green.isHidden = true
            TopYellow.isHidden = false
            BotYellow.isHidden = true
        }
        
        else if(color == br)
        {
         
            TopRed.isHidden = true
            BotRed.isHidden = false
            Green.isHidden = true
            TopYellow.isHidden = true
            BotYellow.isHidden = true
        }
        
        else if(color == by)
        {
            TopRed.isHidden = true
            BotRed.isHidden = true
            Green.isHidden = true
            TopYellow.isHidden = true
            BotYellow.isHidden = false
        }
        
    }
    
}

/**
 In music, the frequency of a note determines its pitch. The standard reference pitch, known as A4 or A440, is set to 440 Hz (Hertz). From there, each note's frequency is calculated based on its relationship to A4 using equal temperament tuning, which divides the octave into 12 equal parts.

 Here are the frequencies for each note in the equal temperament tuning system:

 1. **A4**: 440 Hz
 2. **A#4 / B♭4**: Approximately 466.16 Hz
 3. **B4**: 493.88 Hz
 4. **C5**: 523.25 Hz
 5. **C#5 / D♭5**: Approximately 554.37 Hz
 6. **D5**: 587.33 Hz
 7. **D#5 / E♭5**: Approximately 622.25 Hz
 8. **E5**: 659.25 Hz
 9. **F5**: 698.46 Hz
 10. **F#5 / G♭5**: Approximately 739.99 Hz
 11. **G5**: 783.99 Hz
 12. **G#5 / A♭5**: Approximately 830.61 Hz

 This pattern continues up the keyboard, with each octave doubling in frequency. For example, A5 would be 880 Hz, A6 would be 1760 Hz, and so on. Similarly, for lower octaves, the frequency is halved; A3 would be 220 Hz, A2 would be 110 Hz, and so forth.
 */
