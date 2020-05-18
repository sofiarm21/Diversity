public struct Question {
    public var question : String
    public var answers : [String]
    public var correctAnswer : Int
    
    init(question: String, answers:[String], correctAnswer: Int){
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
        
    }
}
