import 'package:flutter/material.dart';
import 'package:roll_dice/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1,this.color2, {super.key});
  // const GradientContainer.purple({super.key}) : color1 =
  final Color color1;
  final Color color2;

  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1,color2],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/dice-5.png',width: 200,),
                TextButton(onPressed: () {}, child: const Text('click me'))
              ],
            ),
          ),
        );
  }
}
// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colours});
//   final List<Color> colours;
//   @override
//   Widget build(context){
//     return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: colours,
//               begin: startAlignment,
//               end: endAlignment,
//             ),
//           ),
//           child: const Center(
//             child: StyledText('hellos'),
//           ),
//         );
//   }
// }