import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/view_model/product_view_model.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    final obj = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: obj.isLoading == false
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: ((value) {
                      obj.searchItem(value);
                    }),
                    decoration: const InputDecoration(
                        hintText: "search item",
                        filled: true,
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: obj.productList.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Image.network(
                                obj.productList[index].image.toString()),
                            Expanded(
                              child: ListTile(
                                title: Text("${obj.productList[index].title}"),
                                trailing:
                                    Text("${obj.productList[index].price}"),
                              ),
                            ),
                          ],
                        );
                      })),
                ),
              ],
            ),
    );
  }
}