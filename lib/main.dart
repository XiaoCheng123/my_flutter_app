import 'package:flutter/material.dart';

void main() => runApp(MyApp());   // Flutter项目运行之后的入口函数，这里运行MyApp这个类

class MyApp extends StatelessWidget {   // MyApp的类，继承StatelessWidget组件，表示其状态不会发生改变，但是其子组件可以为StatefulWidget组件
  @override   // 重写父类StatelessWidget的构造方法
  Widget build(BuildContext context) {  // 构造页面的函数，其中Context表示其上下文，即通过Context，可以对该组件进行操作
    return MaterialApp(   // 构造函数会返回一个组件，MaterialApp是一个Flutter框架的一个容器Widget
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 声明组件的主题颜色
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),  // 表明MyHomePage为MaterialApp的子Widget，title为其传入子组件的值
    );
  }
}

class MyHomePage extends StatefulWidget {   // MyHomePage的类，继承StatefulWidget组件，表示其状态改变可以使页面发生改变
  MyHomePage({Key key, this.title}) : super(key: key);  // 这里的key为默认加上的，用来标记组件的唯一性，this.title为其构造函数的参数

  final String title;   // 该类的属性，方便构造函数进行构造

  @override
  _MyHomePageState createState() => _MyHomePageState();   // StatefulWidget组件的状态，默认命名为这样，通过createState()函数来返回该组件的页面布局
}

class _MyHomePageState extends State<MyHomePage> {    // 声明_MyHomePageState其为MyHomePage的State类
  int _counter = 0;   // _MyHomePageState的属性

  void _incrementCounter() {    // _MyHomePageState的函数
    setState(() {   // 通过setState进行改变数据，能够让页面也发生改变，如果直接赋值，则不行
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {  // 同上，该为构造页面的函数
    return Scaffold(    // 返回一个Scaffold容器Widget，下面即为对该容器的某些属性的声明
      appBar: AppBar(
        title: Text(widget.title),  // 声明该组件的appBar属性为一个AppBar的容器Widget，并且容器的title为一个Text文本组件，该Text组件的值为MyHomePage的title属性
      ),
      body: Center(   // Scaffold的body，声明其为一个Center容器Widget的页面，使其布局上下左右居中
        child: Column(  // 为Center组件的子组件，是一个按列方向排序的组件，其子组件可以有多个
          mainAxisAlignment: MainAxisAlignment.center,  // Column组件的属性
          children: <Widget>[   // Column组件的子组件，为垂直方向进行排序渲染
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(   // Scaffold的容器，即为图片右下角的按钮，当其点击触发_incrementCounter函数
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
