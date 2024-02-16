import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        flexibleSpace: AppBarWidget(),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                "Investor Behaviour",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.info,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          Text("Analyse sentiments and investor flows.",
                              style: TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/arrow_right.png'),
                      width: 35.0,
                      height: 35.0,
                    )
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (index == 0)
                                ? Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.green),
                                    child: Text(
                                      " POSITIVE",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.red),
                                    child: Text(
                                      " NEGATIVE",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                "SECTOR",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Energy",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const Text(
                              "Multisector",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const Text(
                              "Consumer Non-cyclicals",
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
