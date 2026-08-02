import cocoa


// again similar to an interfaces in other languages
/*                  Protocols section                        */
protocol Vehicle
{
    var name: String { get }
    var currentPassengers: Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    
}

// another random protocol
protocol CanBeElectric
{
    
}

/*              Protocols section           */


class motorized
{
    var motor: Bool
    init(motor: Bool) {
        self.motor = motor
    }
    
}

// Car inherits form both vehicle and electric protocols
// if a car is a subclass, the class name would be listed first
class Car: motorized, Vehicle, CanBeElectric
{
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        var hasMotor: String
        
        if (motor)
        {
            hasMotor = " and this vehicle has a motor"
        }
        else
        {
            hasMotor = " and this vehicle doesnt have a motor"
        }
        print("I'm driving \(distance)km" + hasMotor)
    }
 
    func openSunroof()
    {
        
        print("It's a nice day")
    }
}


struct Bycicle: Vehicle
{
    let name = "Bycicle"
    var currentPassengers: Int = 1
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    
    func travel(distance: Int) {
        print ("I'm cycling \(distance)km")
    }
}

// can either use vehicle:Car ... specify a car
// or vehicle: Vehicle to make any vehicle valid
func commute (distance: Int, using vehicle: Vehicle)
{
    if vehicle.estimateTime(for: distance) > 100
    {
        print("That's too slow! I'll try a differnet vehicle.")
    }
    else
    {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int)
{
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


let car = Car(motor: true)
commute(distance: 100, using: car)

let bike = Bycicle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

//https://stackoverflow.com/questions/24016561/is-playground-a-swift-file-who-can-see-it
// https://developer.apple.com/swift-playgrounds/

/* https://www.tutorialspoint.com/explain-the-difference-between-let-and-var-in-swift#:~:text=We%20use%20the%20let%20keyword,is%20required%20for%20lazy%20properties.
 
 
 https://github.com/jrasmusson/swift-arcade
 good resource
*/

/**
 
 delagate and protocols, a core communication pattern
 https://www.youtube.com/watch?v=JV1BKdz9hUA
 https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html
 
 The delegating object keeps a reference to the other object—the delegate—and at the appropriate time sends a message to it.
    - he message informs the delegate of an event that the delegating object is about to handle or has just handled.
    - The delegate may respond to the message by updating the appearance or state of itself or other objects in the application, and in some cases it can return a value that       affects how an impending event is handled.
    - The main value of delegation is that it allows you to easily customize the behavior of several objects in one central object
 
 
    So the delegating object is what uses the protocol or adheres to the protocol.
    The delegating object, keeps a reference to the delegate...and i guess the protocol is directly configured to interact with the delegate
 
    "he window object sends windowShouldClose: to its delegate to ask it to confirm the closure of the window.
    The delegate returns a Boolean value, thereby controlling the behavior of the window object."
            - so the delegate has knowledge about specific thing the that delegating object wants to know
 
 // I think the lower portion is more correct than the top
 
 The delegating object is typically a framework object, and the delegate is typically a custom controller object.
    - so i guess "typically" in this pattern we would mostly write delegate code
    - specific delegates that would be interfaced from specific protocols
 
 
 
    Hold on: so it seems that
 
    delegating object has reference to the delegate
       - no the delegate is an object or whateever that adheres to the specific protocol
    - so the delegating object calls the sepecific protocol

 now any object or controller in this case can be defined to adhere to the protocol,
 thereby becoming a delegate
 
 so delegates are just pieces of code that are called upon when needed, through the use of protocol/ interface interfacing
 
 https://www.youtube.com/watch?v=JV1BKdz9hUA

 */
