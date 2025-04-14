import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/providers/random_user_provider.dart';
import 'package:random_user/screens/details_screen.dart';
import 'package:random_user/screens/female_screen.dart';
import 'package:random_user/screens/male_screen.dart';
import 'package:random_user/widgets/user_data.dart';

class RandomUserScreen extends StatelessWidget {
  const RandomUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<RandomUserProvider>(context ,listen:  false);
    return Scaffold(

      appBar: AppBar(
        title: const Text('Random User Page'),
        centerTitle: true,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {


                Navigator.push(context, MaterialPageRoute(builder: (context) => const MaleScreen()));

            }, child: const Text('Male')),

            const SizedBox(width: 10, ),
            TextButton(onPressed: () {




              Navigator.push(context, MaterialPageRoute(builder: (context) => const FemaleScreen()));

            }, child: const Text('Female')),
          ],
        ),
      ),

      body:  Consumer<RandomUserProvider>(builder: (context, value, child) {
        var data = value.randomUserModel?.data;
        if(data == null)
          {
             value.randomUser();
             return const Center(child: CircularProgressIndicator());
          }
        else
          {


             return  ListView.builder(itemBuilder: (context, index) {

               return Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) =>  DetailsScreen(name:  data[index]['name']['first'].toString(), email: data[index]['email'].toString(), image:  data[index]['picture']['large'].toString(), address:  data[index]['location']['street']['name'].toString()),));
                    },
                     child: UserData(name: data[index]['name']['first'].toString(), email: data[index]['email'].toString(), image: data[index]['picture']['large'].toString())),
               );
             },
               itemCount: 10,


             );
          }
      },),
      
      bottomSheet: Column(
        children: [
          TextButton(onPressed: () {


            Navigator.push(context, MaterialPageRoute(builder: (context) => const MaleScreen()));

          }, child: const Text('Male')),

          const SizedBox(width: 10, ),
          TextButton(onPressed: () {




            Navigator.push(context, MaterialPageRoute(builder: (context) => const FemaleScreen()));

          }, child: const Text('Female')),
        ],
      ),
    );
  }
}
