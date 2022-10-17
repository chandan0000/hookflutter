import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');
    useEffect((() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }), [controller]);
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text('You type ${text.value}')
        ],
      ),
    );
  }
}


// Stream<String> getTime() => Stream.periodic(
//       const Duration(seconds: 1),
//       (_) => DateTime.now().toIso8601String(),
//     );

// class HomeScreen extends HookWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = useTextEditingController();
//     var v = useState<String>("s");
//     // useEffect(() {
//     //   v.value = controller.text;
//     //   return null;
//     // }, [controller]);

//     final dateTime = useStream(getTime());

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               dateTime.data.toString(),
//               style: TextStyle(fontSize: 50, color: Colors.black),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: 'eneter some thin',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
