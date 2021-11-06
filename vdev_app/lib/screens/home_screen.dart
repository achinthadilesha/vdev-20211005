import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vdev_app/screens/screens.dart';
import 'package:vdev_app/services/auth_service.dart';
import 'package:vdev_app/services/product_service.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<ProductService>(context, listen: false)
        .getPosts()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productService.localUser.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AuthScreen.routeName);
                        Provider.of<AuthService>(context, listen: false)
                            .logout();
                      },
                      child: const Text('sign-out'),
                    ),
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: Text(
                'Product Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: productService.items.length,
                      itemBuilder: (context, index) {
                        return Text(productService.items[index].title ?? '');
                      },
                    ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Signed-in at: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    DateFormat('MMMM-d – kk:mm a').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
