import 'package:cisneros0453/data/product_data.dart';
import 'package:cisneros0453/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(products[index].img),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthScreen()));
                              },
                              child: Text("Skip",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          Text(
                            products[index].title,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            products[index].description,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 10,
                          width: currentPage == index ? 25 : 10,
                          color:
                              currentPage == index ? Colors.red : Colors.white);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    currentPage == 2
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthScreen()));
                            },
                            child: Icon(Icons.arrow_forward_ios))
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
