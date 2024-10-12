
import "dart:math";
import "dart:io";
void main(){
  Game game = Game();
  game.start();
}



class Game{
  List words = ["dog", "apple", "bridge","horse", "tree", "monkey","computer", "dart","gym"];
  List hangedMan = ["______",
                    "|  |  ",                    
                    "|  0 ",
                    "| /|\\",
                    "| / \\",
                    "|     "];
  bool finished = false;
  
  
  
  void start(){
    List word = words[Random().nextInt(words.length)].toString().split('');  
    List dashes = List.generate(word.length,  (index) => "_");
    int correctGuesses = 0;
    int wrongGuesses=0;
    int copiedCorrectGuesses;  
   
    while (!finished){
      copiedCorrectGuesses = correctGuesses;
      //print the hanged man
      print(dashes.join(' '));
      //get the letter 
      
      String guessedLetter = get_value();
      //check if the letter in the word
      int i=0;
      for(String Letter in word){
        
        if (Letter == guessedLetter){
          dashes[i] = Letter;
          correctGuesses+=1;
          if(word.join() == dashes.join()){
            print("You won!!!");
            print("The word is : " + word.join(''));
            finished = true;
          } 
        }
        i+=1;
      }
      //check if the counter value changed
      if((correctGuesses - copiedCorrectGuesses) == 0){
        wrongGuesses += 1;
        printHangedMan(wrongGuesses);
        if (wrongGuesses == hangedMan.length){
          print("You lost");
          finished = true;
        }
      }
      }
    }
      
  
  String get_value(){
    while(true){
      stdout.write("Guess The Letter:");
      String guessedLetter = stdin.readLineSync()!;
      if (guessedLetter.length == 1 && guessedLetter.toLowerCase().contains(RegExp("[a-z]"))){
        return guessedLetter.toLowerCase();
      }
      print("Value error\nPlease enter a valid value.");
    }
  
  }
  
  void printHangedMan(int To){
    for(int i = 0; i < To ; i++){
      print(hangedMan[i]);
    }

  }

}
