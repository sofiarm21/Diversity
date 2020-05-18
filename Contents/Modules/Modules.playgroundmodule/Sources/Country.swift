public struct Country {
    public var name: String
    public var flag: String
    public var language: String
    public var continent: String
    public var capital: String
    
    
    public init(name: String, flag:String, language: String, continent: String, capital: String){
        self.name = name
        self.flag = flag
        self.language = language
        self.continent = continent
        self.capital = capital
    }
}
