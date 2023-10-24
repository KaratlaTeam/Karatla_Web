import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_stories/Logic/rootL.dart';
import 'package:lover_stories/main.dart';
import 'package:lover_stories/plugins/command.dart';
import 'package:lover_stories/plugins/myStepper.dart';
import 'package:lover_stories/type_def.dart';
import 'package:rive/rive.dart';
import 'package:zoom_widget/zoom_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageTransitionSwitcher(
                    duration: const Duration(seconds: 1),
                    reverse: true,
                    transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        ) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        child: child,
                      );
                    },
                    child: _getPage(_),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _getPage(RL _){
    if(_.rS.timeLine.open){
      return _TimePage();
    }else{
      return _DetailPage();
    }
  }

}

class _TimePage extends StatelessWidget {

  final double fSize = 10;
  final double hs = 4;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double maxHeight = constraints.maxHeight;
            return Stack(
              children: [
                ListView(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    SizedBox(
                      height: Get.height/5,
                      child: const RiveAnimation.asset(
                        'assets/rives/4058-8420-rick-and-morty.riv',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  const [
                        Text(
                          '时间轨迹',
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        _.updateYear(2018);
                        _.updateTimeLineOpen();
                      },
                      child: Text('2018',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        //_.updateYear(2019);
                        //_.updateTimeLineOpen();
                      },
                      child: Text('2019 - 已锁',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        //_.updateYear(2020);
                        //_.updateTimeLineOpen();
                      },
                      child: Text('2020 - 已锁',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        //_.updateYear(2021);
                        //_.updateTimeLineOpen();
                      },
                      child: Text('2021 - 已锁',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        //_.updateYear(2022);
                        //_.updateTimeLineOpen();
                      },
                      child: Text('2022 - 已锁',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        //_.updateYear(2023);
                        //_.updateTimeLineOpen();
                      },
                      child: Text('2023 - 已锁',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    TextButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (c) {
                              return AlertDialog(
                                title: const Text("别贪哦，每周一更新"),
                                icon: const Icon(Icons.favorite,color: Colors.pink,),
                                content: Container(
                                  height: Get.height*0.3,
                                  width: Get.width*0.3,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        title: const Text('忆，小魔王（一）'),
                                        onTap: (){
                                          //Get.to(() => const MyLetterWidget());
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => const MyPhotoWidget(
                                                photoPath: 'assets/images/Letter/1.jpeg',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.favorite,color: Colors.pink,),
                          Text('后妈的信',style: TextStyle(fontWeight: FontWeight.bold),),
                          Icon(Icons.favorite,color: Colors.pink,),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('我们遇见的有些早呢',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('为什么呢',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('因为我现在什么都不会',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('有一天你会不会觉得无聊啊',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('不会, 但是',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('有一天你要是觉得累',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('觉得不开心，你可以选择离开',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('怎么会，当然要善始善终了',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('我有缺点的话一定要直接的说出来呐',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('你不温柔，不可爱，不漂亮',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('嗯...那我努力改好了',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('你没有发现我说的都是反话嘛',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('我们在一起有好多好多的事情要做呢',style: TextStyle(color: Colors.blue,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: hs)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('与君初相识，犹如故人归',style: TextStyle(color: Colors.pink,fontSize: fSize),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                    SizedBox(
                      height: Get.height/5,
                      child: const RiveAnimation.asset(
                        'assets/rives/4058-8420-rick-and-morty2.riv',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class MyPhotoWidget extends StatefulWidget {
  const MyPhotoWidget({required this.photoPath,super.key});

  final String photoPath;

  @override
  State<MyPhotoWidget> createState() => _MyPhotoWidgetState();
}

class _MyPhotoWidgetState extends State<MyPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          appBar: AppBar(),
          body: Zoom(
            opacityScrollBars: 0,
            backgroundColor: Colors.white,
            initTotalZoomOut: true,
            //maxZoomWidth: 1800,
            //maxZoomHeight: 1800,
            child: Container(
              width: Get.width*0.9,
              height: Get.height*0.9,
              //color: Colors.yellow,
              child: Image.asset(
                widget.photoPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          //appBar: AppBar(),
          body: Stack(
            children: [
              const SizedBox(
                width: 100,
                child: MyStepperWidget(),
              ),
              const MyMemoryWidget(),
              Container(
                margin: const EdgeInsets.only(left: 140,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${_.rS.timeLine.year}年',style: const TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                      onPressed: (){
                        _.updateTimeLineOpen();
                      },
                      child: const Text('返回时间轨迹'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class MyStepperWidget extends StatefulWidget {
  const MyStepperWidget({super.key});

  @override
  State<MyStepperWidget> createState() => _MyStepperWidgetState();
}

class _MyStepperWidgetState extends State<MyStepperWidget> {
  int _index = 8;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return MyStepper(

          currentStep: _index,
          onStepTapped: (int index) {
            setState(() {
              _index = index;
              _.updateSteeper(index);
            });
          },
          controlsBuilder: (context, details){
            return Container();
          },
          steps: <MyStep>[
            for (int i = 0; i < 12; i += 1)
              MyStep(
                state: i != 8 ? MyStepState.disabled : MyStepState.indexed,
                isActive: i != 8 ? false : true,
              ),
          ],
        );
      },
    );
  }
}


class MyMemoryWidget extends StatefulWidget {
  const MyMemoryWidget({super.key});

  @override
  State<MyMemoryWidget> createState() => _MyMemoryWidgetState();
}

class _MyMemoryWidgetState extends State<MyMemoryWidget> {
  final List myList = []..length = 18;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Container(
          margin: const EdgeInsets.only(left: 70,top: 70),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.only(bottom: 5),
                //color: Colors.yellow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                //elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: 300,
                  child: const Text('都说热恋期是很短的，不知为何，我们似乎一直被防腐剂包裹着。     -------后妈'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 167,
                  itemBuilder: (context, index){
                    index += 1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyPhotoWidget(
                                  photoPath: 'assets/images/2018/20189$index.png',
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/2018/20189$index.png',
                            width: 260,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                //color: Colors.black12,
                height: Get.height*0.2,
                child:
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16/6,
                    viewportFraction: 0.5,
                    enlargeCenterPage: true,
                  ),
                  items: myList.asMap().map((i, e) {
                    int index = i+1;
                    return MapEntry(i,Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: const BoxDecoration(
                        //color: Colors.amber
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyPhotoWidget(
                                photoPath: 'assets/images/Photo/2018/$index.JPG',
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Photo/2018/$index.JPG',
                          //width: 260,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),);
                  }).values.toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}