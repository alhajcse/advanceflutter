
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/user_bloc.dart';
import 'package:flutter_app/model/user_info.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    bloc.fetchAllInformation();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: bloc.allInformation,
          builder: (context, AsyncSnapshot<UserInfo> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,

                      child: Center(
                          child: Text('${snapshot.data.data[index].employeeName}',
                            style: TextStyle(fontSize: 18),
                          )
                      ),
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
