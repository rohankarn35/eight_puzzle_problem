import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tiles extends StatelessWidget {
  var number = [];

  Tiles({super.key, required this.onClick, required this.number});
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.2,
      child: GridView.builder(
          itemCount: number.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return number[index] != 0
                ? GestureDetector(
                  onTap: () {
                    onClick(index);
                  },
                    child: Card(
                      elevation: 5,
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8),
                        
                      ),
                      height: 20,
                      width: 20,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            number[index].toString(),
                            style: GoogleFonts.robotoSlab(
                              fontSize: 25,
                                color: Colors.white, fontWeight: FontWeight.w400),
                          ),
                        ),
                        
                      ),
                      
                    ),
                  ))
                : const SizedBox.shrink();
          }),
    );
  }
}
