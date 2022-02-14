import 'package:flutter/material.dart';
import 'package:spean_test/modules/home_screen/components/horizontal_card.dart';
import 'package:spean_test/modules/home_screen/components/vertical_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  final verticalList = List<Widget>.generate(
      10, (int index) => const VerticalCard(),
      growable: true);

  getHeader({title}) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Flutter Test',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          children: [
            getHeader(title: "Vertical List Header"),
            ...verticalList,
            getHeader(title: "Horizontal List Header"),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const HorizontalCard();
                  }),
            ),
            getHeader(title: "Vertical List Header"),
            ...verticalList,
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
        },
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: const Center(
            child: Text(
              'Scroll to top',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
