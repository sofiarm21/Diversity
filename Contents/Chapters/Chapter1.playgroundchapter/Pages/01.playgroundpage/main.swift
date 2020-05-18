/*:
 
 This is the WWDC20 Swift Student Challenge application made with ❤️ by Sofia Rodriguez
 
 Thanks to Apple for considering me
 
 I hope you enjoy this PlaygroundBook
 
 **🌎 Countries 🌎**
 
 We all know that diversity comes in many different shapes and colors, from a small group of people up to a whole continent, the thing is that diversity is everywhere.
 
 Around the globe we can find different cultures, religions and creeds, languages, sexual orientation... and because of this we are a so diverse specie. We should learn to appreciate, embrace and celebrate our differences, because differences become strengths in a collaborative effort.
 
 This playground gives you a snek peak of some of the diversity around America.
 
 If you run the playground there will be displayed an interactive map of America
 * There are two functions that you can use to highlight diversity facts about America, for this enter a value and select a color
 * Run the playground and the countries that have the parameters you enter will be highlighted
 * Apply multiple highlights and some countries may  be in a combined color
 * Tap a country to display more info about it
 * When you're done go to the next page for a little test-game :)
 
 
 - Important: To run this page you need to complete the two functions below
 
 ````
highlightByLanguage(language: .english, with: .red)
  ````
 
 

 
 */


import PlaygroundSupport
import SpriteKit
import UIKit

class GameScene: SKScene {
    override func sceneDidLoad(){
        
        highlightByLanguage(language: <#T##language##Language#>, with: #colorLiteral(red: 0.9607843137254902, green: 0.7058823529411765, blue: 0.2, alpha: 1.0))
        highlightByContinent(continent: <#T##continent##Continent#>, with:#colorLiteral(red: 0.23921568627450981, green: 0.6745098039215687, blue: 0.9686274509803922, alpha: 1.0))
        
    }
    
//#-hidden-code

    lazy var countryDetailsView = childNode(withName: "CountryDetailsView") as! SKSpriteNode
    
           
           
    lazy var Canada = childNode(withName: "//Canada") as! SKSpriteNode
    lazy var UnitedStates = childNode(withName: "//UnitedStates") as! SKSpriteNode
    lazy var UnitedStates2 = childNode(withName: "//UnitedStates2") as! SKSpriteNode
           
    lazy var Mexico = childNode(withName: "//Mexico") as! SKSpriteNode
    lazy var Guatemala = childNode(withName: "//Guatemala") as! SKSpriteNode
    lazy var Honduras = childNode(withName: "//Honduras") as! SKSpriteNode
    lazy var Nicaragua = childNode(withName: "//Nicaragua") as! SKSpriteNode
    lazy var Panama = childNode(withName: "//Panama") as! SKSpriteNode
           
    lazy var Argentina = childNode(withName: "//Argentina") as! SKSpriteNode
    lazy var Bolivia = childNode(withName: "//Bolivia") as! SKSpriteNode
    lazy var Brazil = childNode(withName: "//Brazil") as! SKSpriteNode
    lazy var Chile = childNode(withName: "//Chile") as! SKSpriteNode
    lazy var Colombia = childNode(withName: "//Colombia") as! SKSpriteNode
    lazy var Paraguay = childNode(withName: "//Paraguay") as! SKSpriteNode
    lazy var Peru = childNode(withName: "//Peru") as! SKSpriteNode
    lazy var Venezuela = childNode(withName: "//Venezuela") as! SKSpriteNode
    lazy var Uruguay = childNode(withName: "//Uruguay") as! SKSpriteNode
    lazy var Ecuador = childNode(withName: "//Ecuador") as! SKSpriteNode
    lazy var Guyana = childNode(withName: "//Guyana") as! SKSpriteNode
           
           
    lazy var countryNameLabel = childNode(withName: "//CountryNameLabel") as? SKLabelNode
           
    lazy var countryFlagLabel = childNode(withName: "//CountryFlagLabel") as? SKLabelNode
    lazy var countryLanguageLabel = childNode(withName: "//CountryLanguageLabel") as? SKLabelNode
    lazy var countryCapitalLabel = childNode(withName: "//CountryCapitalLabel") as? SKLabelNode
    
    lazy var countryNodes = [Mexico, Canada, UnitedStates, UnitedStates2, Argentina, Bolivia, Brazil, Chile, Colombia, Paraguay, Peru, Venezuela, Guatemala, Honduras, Nicaragua,Panama , Uruguay, Ecuador, Guyana]
    
    func trasformLanguageEnumsToStrings(language: Language) -> String{
        switch language {
        case .arabic:
            return "arabic"
        case .french:
            return "french"
        case .mandarin:
            return "mandarin"
        case .portuguese:
            return "portuguese"
        case .russian:
            return "russian"
        case .english:
            return "english"
        case .spanish:
            return "spanish"
        case .none:
            return ""
        default:
            return ""
        }
    }

    
    func transformContinentsToString(_ continent: Continent) ->String{
        switch continent {
        case .America:
            return "America"
        case .Asia:
            return "Asia"
        case .Africa:
            return "Africa"
        case .Europe:
            return "Europe"
        case .Austrlia:
            return "Australia"
        case .none:
            return ""
        default:
            return ""
        }
        
    }
    
    func showCountryDetails (country: String){
        if country == "UnitedStates2" {
            countryNameLabel!.text = countries["UnitedStates"]!.name
            countryFlagLabel!.text = countries["UnitedStates"]!.flag
            countryLanguageLabel!.text = "Language: \(countries["UnitedStates"]!.language)"
            countryCapitalLabel!.text = "Capital: \(countries["UnitedStates"]!.capital)"
            countryDetailsView.run(SKAction.fadeIn(withDuration: 1.5))
        }else{
            countryNameLabel!.text = countries[country]!.name
            countryFlagLabel!.text = countries[country]!.flag
            countryLanguageLabel!.text = "Language: \(countries[country]!.language)"
            countryCapitalLabel!.text = "Capital: \(countries[country]!.capital)"
            countryDetailsView.run(SKAction.fadeIn(withDuration: 1.5))
        }
        
        
        
    }
    
    func colorLanguageCountry (language:String, with color: UIColor){

        for country in countryNodes{
            print(countryNodes)
            print(country)
            if country.name! == "UnitedStates2"{
                if countries["UnitedStates"]!.language == language{
                    country.colorBlendFactor = 1
                    country.blendMode = SKBlendMode.alpha
                    country.color = (country.color.add(overlay: color.withAlphaComponent(0.5)))
                }
            }else{
                if countries[country.name!]!.language == language{
                    country.colorBlendFactor = 1
                    country.blendMode = SKBlendMode.alpha
                    country.color = (country.color.add(overlay: color.withAlphaComponent(0.5)))
                }
            }
        }
    }
    
    func highlightByLanguage(language: Language?, with color: UIColor){
        var language = trasformLanguageEnumsToStrings(language: language ?? .none)
        colorLanguageCountry(language: language, with: color)
    }
    
    func highlightByContinent(continent: Continent?, with color: UIColor){
        var continentString = transformContinentsToString(continent ?? .none)
        for country in countryNodes{
            
            if country.name! == "UnitedStates2"{
                if countries["UnitedStates"]!.continent == continentString{
                    country.colorBlendFactor = 1
                    country.blendMode = SKBlendMode.alpha
                    country.color = (country.color.add(overlay: color.withAlphaComponent(0.5)))
                }
            }else{
                if countries[country.name!]!.continent == continentString{
                    country.colorBlendFactor = 1
                    country.blendMode = SKBlendMode.alpha
                    country.color = (country.color.add(overlay: color.withAlphaComponent(0.5)))
                }
            }
            
        }
    }
    
    //sceneKit funcs

    
    override func didMove(to view: SKView) {
        countryDetailsView.alpha = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (countryDetailsView.alpha == 1)
        {
            countryDetailsView.run(SKAction.fadeOut(withDuration: 1.5))
        }
        
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
   
        countryDetailsView.position = CGPoint(x: touchLocation.x + 100, y: touchLocation.y )
        
        //match country touched node
        
        for node in countryNodes {
            if (touchedNode == node){
                showCountryDetails(country: touchedNode.name!)
                
                node.run(SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.5),SKAction.scale(to: 1.0, duration: 0.5)]))
            }
        }
    }
    
   
}


// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    //scene.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code
