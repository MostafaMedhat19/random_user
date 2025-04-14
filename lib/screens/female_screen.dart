import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/providers/random_user_provider.dart';
import 'package:random_user/screens/details_screen.dart';
import 'package:random_user/screens/female_screen.dart';
import 'package:random_user/screens/male_screen.dart';
import 'package:random_user/widgets/user_data.dart';

class FemaleScreen extends StatelessWidget {
  const FemaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<RandomUserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Page Female'),
        centerTitle: true,

      ),

      body:  Consumer<RandomUserProvider>(builder: (context, value, child) {
        var data = value.randomUserModelFeMale?.female;

        if( data == null)
        {
          value.FemaleUser();
          return const Center(child: CircularProgressIndicator());
        }
        else
        {


          return  ListView.builder(itemBuilder: (context, index) {

            return GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder:  (context) =>  DetailsScreen(name:  data[index]['name']['first'].toString(), email: data[index]['email'].toString(), image:  data[index]['picture']['large'].toString(), address:  data[index]['location']['street']['name'].toString()),));
                },
                child: UserData(name: data[index]['name']['first'].toString(), email: data[index]['email'].toString(), image: data[index]['picture']['large'].toString()));
          },
            itemCount: 20,


          );
        }
      },),
    );
  }
}
