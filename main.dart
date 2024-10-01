import "dart:math";
import "dart:io";
void main(){
  Game game = Game();
  List list = ['a','s'];
  bool n = game.doesNotHaveDashes();
  print(n);
}



class Game{
  List words = ["dog", "apple", "bridge"];
  List hangedMan = ["______",
                    "|  |  ",                    
                    "|  0 ",
                    "| /|\\",
                    "| / \\",
                    "|     "];
  void start(){
    List word = words[Random().nextInt(words.length)].toString().split('');  
    List dashes = List.generate(word.length,  (index) => "_");
    print(dashes.join(''));
    stdout.write("Guess The Letter");
    String? inputLetter = stdin.readLineSync();

    int i=0;
    for(String Letter in word){
      if (Letter == inputLetter){
        dashes[i] = Letter;
        if(doesNotHaveDashes(dashes) == true){
          print("won");
        } 
      }

      i+=1;
    }
    
    bool? doesNotHaveDashes(List list){
      int listLen = list.length; 
      int j = 0;
      for(String i in list){
        if (i != "_"){
          j+=1;
          if (j == listLen){
              return true;    
          } 
        }
      }
    }

  }



}