import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'PKCOIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client httpClient;
  Web3Client ethClient;
  bool data = false;

  final myAddress = '0x0c67e876d2E031058041Be252514d8DaDe497C59';
                    
  var myData;

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(
        "https://rinkeby.infura.io/v3/cd8420c26b1b4efaad577327e2d9091b",
        httpClient);
    getBalance(myAddress);
  }

  Future<DeployedContract> loadContract() async {
    String api = await rootBundle.loadString("assets/api.json");
    String contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";
    final contract = DeployedContract(ContractAbi.fromJson(api, "PKCoin"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(String targetAddress) async {
    //EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    List<dynamic> result = await query("getBalance", []);
    myData = result[0];
    data = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.blue[600],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '\$PKCOIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 133,
                        width: 330,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Balance",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.grey[700])),
                            SizedBox(
                              height: 10,
                            ),
                            data
                                ? Text(
                                    '\$$myData',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : CircularProgressIndicator()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 55),
                    Row(
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          child: FlatButton.icon(
                              height: 50,
                              onPressed: () {
                                getBalance(myAddress);
                              },
                              color: Colors.blue,
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Refresh",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          child: FlatButton.icon(
                              height: 50,
                              onPressed: () {},
                              color: Colors.green,
                              icon: Icon(
                                Icons.call_made_outlined,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Deposit",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          child: FlatButton.icon(
                              height: 50,
                              onPressed: () {},
                              color: Colors.red,
                              icon: Icon(
                                Icons.call_received_outlined,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Withdrow",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
