import 'package:eight_puzzle_game/widgets/tiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class board extends StatefulWidget {
  const board({super.key});

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  int moves = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          
           SizedBox(
            height: 150,
           ),
          Center(child: Tiles(onClick: onClick, number: number)),
        // SizedBox(height: 40,),
        Text(
                            "Moves: ${moves}",
                            style: GoogleFonts.robotoSlab(
                              fontSize: 25,
                                color: Colors.black, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                              
                                    onPressed: shuffleGame,
                                    child: Text("Shuffle",style: TextStyle(fontSize: 15, color: Colors.white),),
                                  ),
                          ),
        ],
      ),
    );
  }

  void onClick(index) {
    if (index - 1 > 0 && number[index - 1] == 0 && index % 3 != 0 ||
        index + 1 < 9 && number[index + 1] == 0 && (index + 1) % 3 != 0 ||
        (index - 3 >= 0 && number[index - 3] == 0) ||
        (index + 3 < 9 && number[index + 3] == 0)){
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        moves++;
      });
        }
        checkWineer();
  }
  bool ishorted(List numberList){
    int first = numberList.first;
    for(int i = 1; i< numberList.length;i++){
      int nextNumber = numberList[i];
      if(first>nextNumber)
        return false;
        first = numberList[i];
      
    }
    return true;
  }
  void checkWineer(){
    bool isWinner = ishorted(number);
    if(isWinner){
      showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Winner",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ));
    }
      );
      setState(() {
        number.shuffle();
        moves = 0;
      });
    }
  }
  void shuffleGame(){
    setState(() {
      number.shuffle();
    moves = 0;
    });
    
  }
  void showWinnerDialog(BuildContext context) {
  


    }
}
