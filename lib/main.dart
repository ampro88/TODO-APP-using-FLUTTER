import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mytrial(),
    );
  }
}

class Mytrial extends StatefulWidget {



  @override
  _MyHome createState() => _MyHome();

}

class _MyHome extends State<Mytrial> {
  List<String> work=[];
  late String ip;
  late SharedPreferences pref;
  @override
  void initState() {

    // TODO: implement initState


    forshared();

    super.initState();
  }
  forshared() async
  {
    pref= await SharedPreferences.getInstance();
    loaddata();

    setState(() {

    });

  }
  void loaddata()
  {
    work=pref.getStringList('list')!;
    setState(() {

    });
  }
  void saved()
  {
    pref.setStringList('list', work);

  }

  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MY TODO APP"),
        centerTitle: true,
      ),
      body: (work!=null)? ListView.builder(
        itemCount: work.length,
        itemBuilder:(BuildContext context,int index){
          return  Container(
            child:Card(

                key: Key(work[index]),
                elevation: 10,
                child: ListTile(
                    title:Text(work[index]),
                    trailing: IconButton(icon:Icon(Icons.delete,color: Colors.red,

                    ),
                      onPressed: ()
                      {
                        setState(() {
                          work.removeAt(index);
                          saved();
                        });
                      },)

                )

            ),

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow:[ BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3),
                )]
            ),


          );
        },
      ):Center(child: Text("ADD UR WORKS !!"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add,size: 20,color: Colors.white,),
        onPressed: ()
        {
          showDialog(context: context,
              builder: (BuildContext context)
              {
                return AlertDialog(
                  title: Text("ADD UR WORK"),
                  content: TextField(
                    onChanged: (String val)
                    {
                      ip=val;

                    },
                  ),
                  actions: <Widget>[
                    RaisedButton(
                        child:Text("ADD WORK"),
                        onPressed: ()
                        {

                          setState(() {
                            work.add(ip);
                            Navigator.of(context).pop();
                            saved();
                          });
                        }


                    )

                  ],

                );
              }

          );

        },
      ),);



  }
}
