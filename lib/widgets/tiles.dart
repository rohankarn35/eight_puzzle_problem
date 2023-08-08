import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  var number = [];

  Tiles({super.key, required this.onClick});
  Function onClick;

  @override
  Widget build(BuildContext context) {
 

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: number.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
      
      ), 
      
      itemBuilder: (context,index){
        return number[index] != 0?TextButton(onPressed: (){
          onClick(index);
        }, 
        child: Text(number[index])):const SizedBox.shrink();
      }),
    );
  }
}