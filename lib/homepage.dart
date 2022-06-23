import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController value = TextEditingController();

  TextEditingController sepe = TextEditingController();

  TextEditingController op = TextEditingController();
  var opp = [];
  var x = "1";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Comma Seperator"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:Padding(
        padding: EdgeInsets.all(15),
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                controller: value,
                maxLines: 5,

              ),
              TextField(
                controller: sepe,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Enter Seperator',
                ),
                maxLength: 1,
              ),
              RaisedButton(
                textColor: Colors.black,
                color: Colors.blueGrey,
                child: Text('Seperate'),
                onPressed: (){
                  seperatefun();
                },
              ),
              Visibility(
                  visible: x == "1"? false:true,
                  child:Column(
                    children: [
                      Text("Size : ${opp.length}"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: opp.length,
                          itemBuilder: (BuildContext context, int index) =>InkWell(
                            onTap: (){
                              value.text = "${opp[index]}";
                            },
                            child:  Row(
                              children: [
                                Center(child: Text("${index} -")),
                                SizedBox(width: 25,),
                                Center(child: Text("${opp[index]}"))
                              ],
                            ),
                          ),  //
                        ),
                      )
                    ],
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }

  void seperatefun() {
    opp = [];
    var a = value.text;
    var b = sepe.text;
    var c = a.split(b);

    setState((){
      for (var i = 0; i < c.length; i++) {
        opp.add(c[i]);
      }
      x = "0";
    });
  }
}
