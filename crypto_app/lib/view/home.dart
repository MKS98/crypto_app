import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/item.dart';
import '../model/coin_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: myHeight,
          width: myWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 254, 221, 87), Color(0xfffbc700)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: myWidth * 0.03, vertical: myHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.02,
                            vertical: myHeight * 0.005),
                        child: Text(
                          'Main Account',
                          style: TextStyle(fontSize: myWidth * 0.035),
                        ),
                      ),
                    ),
                    Text(
                      'Top 10 Coins',
                      style: TextStyle(fontSize: myWidth * 0.035),
                    ),
                    const Text(
                      'Experimental',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$ 751,648,4',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(myWidth * 0.017),
                      height: myHeight * 0.04,
                      width: myWidth * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Image.asset('assets/icons/5.1.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                child: Row(
                  children: const [
                    Text(
                      '+%168 all time',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: myHeight * 0.02),
              Container(
                height: myHeight * 0.7,
                width: myWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: myHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Assets',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                    Expanded(
                        child: isRefreshing == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: coinMarket!.length,
                                itemBuilder: (context, index) {
                                  return Item(
                                    item: coinMarket![index],
                                  );
                                },
                              ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    setState(() {
      isRefreshing = true;
    });

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    setState(() {
      isRefreshing = false;
    });

    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
