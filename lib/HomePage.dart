import 'package:flutter/material.dart';
import 'package:scouting_frc/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('6725'),
          actions: <Widget>[

            IconButton(
              alignment: Alignment.centerLeft,
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ]
      ),


      body: Column(

        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          SizedBox(
            height: 80,
            child: ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter())
              );
            }, child:
            Text('Match Scouting')
            ),
          ), // BUTTON 1

          Spacer(),
          SizedBox(
            height: 80,
            child:
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter())
                );
              },
              clipBehavior: Clip.antiAlias,// <--add this
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // <--add this
                ),
                padding: EdgeInsets.zero, // <--add this
              ),
              child: Image.network('url...', fit: BoxFit.cover),
            ),
          ),

          Spacer(),
          SizedBox(
            height: 80,
            child:
            ElevatedButton(
              // child: const Text('Match Scouting'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter())
                  // MaterialPageRoute(builder: (context) => const CounterState()),
                );
              },
              clipBehavior: Clip.antiAlias,// <--add this
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // <--add this
                ),
                padding: EdgeInsets.zero, // <--add this
              ),
              child: Image.network('url...', fit: BoxFit.cover),
            ),
          ),

          Spacer(),
          SizedBox(
            height: 80,
            child:
            ElevatedButton(

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter())
                );
              },
              clipBehavior: Clip.antiAlias,// <--add this
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // <--add this
                ),
                padding: EdgeInsets.zero, // <--add this
              ),
              child: Image.network('url...', fit: BoxFit.cover),
            ),
          ),

          Spacer(flex: 50)
        ],
      ),
    );
  }
}