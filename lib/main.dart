
import 'package:flutter/material.dart';

import 'Questions.dart';


void main() =>
    runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
    );

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  var score = 0;
  var n=0;
  List que_list =[
    Questions("1.Does CSK Team Won IPL 2023", true),
    Questions("2.Does RCB Team won any IPL", false),
    Questions("3. Kolkata Knight Riders (KKR) holds the record for the highest team total in an IPL match.", false),
    Questions("4.AB de Villiers holds the record for the fastest century in IPL history.", false),
    Questions("5.Andre Russell holds the record for the most sixes in a single IPL season till 2021", true),
    Questions("6.Kings XI Punjab (now Punjab Kings) holds the record for the highest successful run chase in IPL history.", false),
    Questions("7. Rashid Khan is the youngest player to take a five-wicket haul in an IPL match.", true),
    Questions("8.The Delhi Capitals franchise has undergone a name change more than once.", false),
    Questions("9. James Faulkner holds the record for the best bowling figures in an IPL match till 2021.", true),
    Questions("10.Chris Gayle has scored a century for three different IPL franchises.", true),
    Questions("11.The first hat-trick in IPL history was taken by Lakshmipathy Balaji in 2008.", true),
    Questions("12. Sachin Tendulkar has hit more than one century in IPL matches.", false),
    Questions("13. Chennai Super Kings holds the record for the most consecutive wins in an IPL season.", false),
    Questions("14.Amit Mishra is the only bowler to have taken three hat-tricks in IPL history.", true),
    Questions("15.Shane Watson won the IPL MVP award in the same season he won the Orange Cap.", true),
    Questions("16. Glenn Maxwell has never been part of the Mumbai Indians franchise in the IPL.", true),
    Questions("17.There has been at least one tied match in the IPL playoffs, leading to a Super Over to determine the winner.", false),
    Questions("18.Chris Lynn has scored a century in an IPL match.", true),
    Questions("19.The IPL has been held twice in a calendar year.", true),
    Questions("20.An IPL match has been played at the Greenfield International Stadium in Thiruvananthapuram, Kerala.", true),




  ];

  void checkanswer(bool choice,BuildContext ctx){
    if (choice==que_list[n].ans)
    {
      // debugPrint("Correct Answer");

      score=score+1;
      final snackbar = SnackBar(content: Text("Correct Answer"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,);
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);

    }
    else{
      final snackbar = SnackBar(content: Text("Wrong Answer"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,);
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if(n<que_list.length-1)
      {
        n=n+1;
      }
      else{
        final snackbar = SnackBar(content: Text("Quiz Completed"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
        reset();

      }
    });
  }

  void reset(){
    setState(() {
      n=0;
      score=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        title: Text("Cricket Quiz"),centerTitle: true,),
      body: Builder(

        builder:(ctx)=>
            Container(
                padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Score : $score/20',style: TextStyle(color: Colors.indigo.shade500,fontWeight: FontWeight.bold,fontSize: 20.0),),
                        InkWell(onTap:()=>reset(),child: Text('RESET',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20.0),)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 120.0,width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black,)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(que_list[n].que,style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(


                      children: [
                        SizedBox(height: 30.0,width: 100.0),
                        ElevatedButton(onPressed: ()=>checkanswer(true,ctx), child: const Text('YES'),),

                        const SizedBox(width: 20.0,),
                        ElevatedButton(onPressed: ()=>checkanswer(false,ctx), child: Text('NO'),)

                      ],

                    )

                  ],
                )


            ),
      ),






    );
  }
}

