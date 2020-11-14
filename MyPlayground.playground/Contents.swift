import Foundation
class Figure {
    private(set) var name: String
    
    private(set) var volume: Bool
    
   
    init(name: String, volume: Bool){
        self.name = name
        self.volume = volume
    }
    func sqr()->Double{
        return 0.0
    }
}

class Triangle : Figure { //не объемная фигура
    var a: Double
    var b: Double
    var c: Double
    
    override var name: String{
        return "Triangle"
    }
    override var volume: Bool {
        return false
    }
    
    init (a:Double, b:Double, c:Double) {
        self.a = a
        self.b = b
        self.c = c
        
        super.init(name: "Triangle", volume: true)
    }
   
    
   
    override func sqr()->Double {
        let pp : Double = (a + b + c)/2
        return sqrt(pp*(pp-a)*(pp-b)*(pp-c))
    }
}

class Circle : Figure { //не оъемная фигура
    var radius: Double
    override var name: String{
        return "Circle"
    }
    override var volume: Bool {
        return false
    }
    init (r: Double) {
        radius = r
        super.init(name: "Circle", volume: false)
    }
    override func sqr() -> Double {
        return (Double.pi * pow(self.radius,2))
    }
}
protocol QuadrangularFigures {
    var a: Double { get set }
    var b: Double { get set }
    var v: Double {get}
    
}
class Rectangle : Figure, QuadrangularFigures { //объемная фигура
    var a: Double
    var b: Double
    var c: Double
    var v: Double {
        get{
            return (a*b*c)
        }
    }
    override var name: String{
        return "Rectangle"
    }
    override var volume: Bool {
        return true
    }
    init (a: Double, b:Double, c:Double){
        self.a = a
        self.b = b
        self.c = c
        super.init(name: "Rectangle", volume:false)
    }
    override func sqr() -> Double {
        return 2*(a*b + a*c + b*c)
    }
}

extension Figure {
    func addToName() {
        if (volume == true) {self.name = "Three-dimensional" + self.name.lowercased()}
    }
}




