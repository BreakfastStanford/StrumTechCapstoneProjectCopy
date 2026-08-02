//
//  FreeModeViewController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/2/24.
//

import UIKit

class FreeModeViewController : BLEViewControllerBase
{
    struct EffectData: Codable
    {
        var effect: Int
        var parameter1: Int
        var parameter2: Int
    }
    
    var eData: EffectData? = nil
    var defaultColor: UIColor? = nil
    var pushedColor : UIColor? = nil
    
    @IBOutlet weak var Effect1: UIButton!
    
    @IBOutlet weak var Effect2: UIButton!
    
    @IBOutlet weak var Effect3: UIButton!
    
    @IBOutlet weak var Slider1: UISlider!
    
    @IBOutlet weak var Slider2: UISlider!
    
    
    var activeEffect = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.eData = EffectData(effect: 0, parameter1: 0, parameter2: 0)
        defaultColor = Effect1.backgroundColor
        pushedColor = UIColor.green
        Slider1.isHidden = true
        Slider2.isHidden = true
           Effect1.setTitle("Reverb", for: .normal)
        Effect2.setTitle("Chorus", for: .normal)
        Effect3.setTitle("Distortion", for: .normal)
    }
    
    /*
    init() {
        self.eData = EffectData(effect: 0, parameter1: 0, parameter2: 0)
        super.init(nibName: nil, bundle: nil)

    }
    */
    /*
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     */
    
    
    @IBAction func SendEffect1(_ sender: UIButton)
    {
        eData?.effect = AssignEffect(effect: 1, name: Effect1.currentTitle!)
        SendEffect(effect: eData!)
    }
    
 
    @IBAction func SendEffect2(_ sender: UIButton) 
    {
        eData?.effect = AssignEffect(effect: 2, name: Effect2.currentTitle!)
        SendEffect(effect: eData!)
    }
    
    @IBAction func SendEffect3(_ sender: UIButton)
    {
        eData?.effect = AssignEffect(effect: 3, name: Effect3.currentTitle!)
        SendEffect(effect: eData!)
    }
    
    /*
    @IBAction func SendParemeter1(_ sender: UISlider)
    {
        var set = round(sender.value)
        eData?.parameter1 = Int(set)
        sender.value = set
        SendEffect(effect: eData!)
    }
    
    @IBAction func SendParemeter2(_ sender: UISlider)
    {
        var set = round(sender.value)
        eData?.parameter2 = Int(set)
        sender.value = set
        SendEffect(effect: eData!)
    }
    */
    
    func SendEffect(effect: EffectData)
    {
        
        bleObject?.sendStringDataOverBluetooth(JsonEncoder(effect: effect), (bleObject?.effectsCharacteristic)!, false)
        
    }
    
    
    
    
    override func SetDefaultGuitarMode() -> GuitarModeEnum
    {
        return .free
    }
    
    func JsonEncoder(effect: EffectData) -> String
    {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try? encoder.encode(effect)
        return String(data: (data) ?? Data(), encoding: .utf8) ?? String()
    }
    
    func AssignEffect (effect: Int, name: String) -> Int
    {
        if (effect == activeEffect)
        {
            activeEffect = 0
            SetButtonColor(name, activeEffect)
            return 0
            
        }
        else
        {
            activeEffect = effect
            SetButtonColor(name, activeEffect)
            return effect
        }
    }
    
    
    func SetButtonColor(_ name: String, _ active: Int)
    {
        
        
        let allSubviews = self.view.subviews

        // Filter the subviews to only get those that are UIButton instances
        let allButtons = allSubviews.compactMap { $0 as? UIButton }
        
        // Assuming you have an array of buttons named `allButtons`
        for button in allButtons 
        {
            
            if(button.currentTitle == name && active == 0)
            {
                
                button.backgroundColor = defaultColor
                continue
                
            }
            else if (button.currentTitle == name && active != 0)
            {
                button.backgroundColor = pushedColor
                continue
            }
               
            button.backgroundColor = defaultColor
        
        }
    }
    
    
    
    // maybe viewill appear would be better
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        SetButtonColor("", 0)
      
        
    }
}
