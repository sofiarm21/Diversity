/*:

This is the WWDC20 Swift Student Challenge application made with ❤️ by Sofia Rodriguez
 
**🚩 Flag Trivia 🚩**
     
Now let's test what youe learned
Choose the name of the country that belongs to the flag
 When you feel ready tap the start button
     
If you want to review the flags before start you can go to the past page and come back later
 
*/

//#-hidden-code

import PlaygroundSupport
import SwiftUI

var inmutedQuestions = questions

struct StartView : View {
    
    func pickFlag()->String{
        var country =  questions.choose(1)
        return country[0].question
    }
    @State private var startGame = false
    var body : some View {
        VStack{
            Text("\(self.pickFlag()) Flag Trivia \(self.pickFlag())")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(50)
            Text("Test your knowledge in general culture and diversity")
                .fontWeight(.bold)
                .padding(20)
                .font(.title)
            HStack{
                
                ForEach(0..<3) { number in
                    Text(self.pickFlag())
                        .padding(60)
                        .font(.system(size: 100))
                    
                }
            }
            Button(action: {
                self.startGame.toggle()
            }){
                HStack{
                    Text("Start!")
                        .fontWeight(.bold)
                        .frame(maxWidth: 300)
                }
                .sheet(isPresented: self.$startGame) {
                    ContentView()
                }
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }
        }
    }
}


struct EndGameView : View {
    
    func scoreString(_ score: Int) -> String {
        print(score)
        if score < 5{
            return "You should go back page 1 😿"
        }else if score >= 9{
            return "You're a master on this! 🚀🚩"
        }else{
           
            return "You're doing great 💪"
        }
    }
    
    func playSoundEffect(_ score: Int){
        if(score >= 5){
            playSound("win", type: "mp3")
        }else{
             playSound("fail", type: "mp3")
        }

    }
    
    var score: Int
    @State private var playAgain = false
    var body : some View {
        VStack{
            Text("Game over")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(50)
            
            Text("Your final score was: \(score)")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(20)
            
            Text(scoreString(score))
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(50)
            
            Button(action: {
                self.playAgain.toggle()
            }){
                HStack{
                    Text("Play again")
                        .frame(maxWidth: 250)
                }
                .sheet(isPresented: self.$playAgain) {
                    ContentView()
                }
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                
            }
            
        }
        .onAppear {
            self.playSoundEffect(self.score)
        }
        
    }
}


struct ContentView: View {
    
    @State var choiceAcerted : Bool = nil
    
    struct GradientButtonStyle : ButtonStyle {
        public func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15.0)
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            withAnimation() {
                self.currentProgress += 0.01
                if self.currentProgress >= 1.0 {
                    timer.invalidate()
                    self.optionTapped(8)
                }
                if self.gameEnd{
                    timer.invalidate()
                }
            }
        }
    }
    
    func checkAnswer(_ question:Question)-> Bool{
        return false
    }
    
    func optionTapped(_ choice: Int){
        self.currentProgress >= 1.0
        if choice == questions[currentQuestion].correctAnswer{
             playSound("tap", type: "mp3")
            choiceAcerted = true
            score += 1
            self.questionsCount += 1
        }else{
            choiceAcerted = false
             playSound("fails", type: "wav")
            if (score > 0){
                score -= 1
            }
        }
        
            self.currentProgress = 0
            self.generateQuestion()
        
        
    }
    func generateQuestion(){
        self.startLoading()
        questions.remove(at: currentQuestion)
        print(questionsCount)
        if self.questionsCount < 10 && questions.count > 1 {
            questions.shuffle()
            currentQuestion = Int.random(in: 0..<questions.count)
        }else{
            gameEnd = true
        }
    }
    
    func choiceString(_ choice:Bool?)->String{
        if choice != nil {
            return choice! ? "Right 🥳" : "Wrong 😭"
        }else {
            return ""
        }
    }
    
    @State var currentProgress: CGFloat = 0.0
    
    @State var questionsCount = 0
    @State private var currentQuestion = Int.random(in: 0..<questions.count)
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var showingAlert = false
    @State private var gameEnd = false

    var body: some View {
        
        GeometryReader { geometry in
        
            VStack(spacing: 50) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.gray)
                        .frame(width: 300, height: 20)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: 300*self.currentProgress, height: 20)
                    .cornerRadius(20)
                }
                
                Text(self.choiceString(self.choiceAcerted ?? nil))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    
                Text("Score: \(self.score)")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                Text(questions[self.currentQuestion].question)
                    .fontWeight(.bold)
                    .font(.system(size: 100))
                
                ForEach(0..<3) { number in
                    
                    Button(action: {
                       
                        self.optionTapped(number)
                        if (self.gameEnd){
                            print("copy questions")
                            questions = inmutedQuestions
                        }
                    }) {
                        HStack {
                            Text(questions[self.currentQuestion].answers[number])
                                .frame(maxWidth: 500)
                        }
                    }
                    .buttonStyle(GradientButtonStyle())
                    .sheet(isPresented: self.$gameEnd) {
                        EndGameView(score: self.score)
                    }
                }
            }
        }.onAppear{
            self.startLoading()
        }
    }
}


extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}



PlaygroundPage.current.setLiveView(StartView())











//#-end-hidden-code
