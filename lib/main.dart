import 'package:flutter/material.dart';
import 'package:kick_start_flutter/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kick Start Flutter",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const SafeArea(child: HomePage(title: "Landing Page")),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.amberAccent,
            ),
            onPressed: null,
            tooltip: "Navigation Menu"),
        Expanded(child: title),
        const IconButton(
            icon: Icon(Icons.search), onPressed: null, tooltip: "Search Items"),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildSubtitle(BuildContext context) =>
      Text(heading, style: Theme.of(context).textTheme.headlineLarge);

  @override
  Widget buildTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubtitle(BuildContext context) => Text(
        sender,
        style: const TextStyle(
            color: Colors.white, backgroundColor: Colors.amberAccent),
      );

  @override
  Widget buildTitle(BuildContext context) => Text(
        body,
        style:
            const TextStyle(color: Colors.white, backgroundColor: Colors.green),
      );
}

/* Base Image List Item */
Widget _buildDecoratedImage() => Expanded(
        child: Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Image.network(
          "https://bonmasala.com/wp-content/uploads/2022/10/mutton-biriyani-recipe.jpeg"),
    ));

Widget _buildImageRow() => Row(
      children: [_buildDecoratedImage(), _buildDecoratedImage()],
    );

Widget _buildImageColumn() => Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: Column(
        children: [_buildImageRow(), _buildImageRow()],
      ),
    );

Widget _buildStack() => Stack(
      alignment: const Alignment(0.2, 0.2),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/ram_img.png"),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: const Text(
            "Large Flutter",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Text(
          "Flutter",
          style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.amber,
              fontSize: 10),
        )
      ],
    );

Widget _buildListView() {
  final items = List<ListItem>.generate(
      12,
      (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message Body $i"));

  return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          "App Bar Title",
          style: TextStyle(color: Colors.deepPurple, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("You have tapped the button this many times: "),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage()));
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orangeAccent[400]),
                child: const Center(
                  child: Text("Go to Second Page"),
                ),
              ),
            ),
            Image.network(
              "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Column(
                    children: [
                      Text(
                        "Biriyani",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "To create a  column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns."),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "⭐",
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                "⭐",
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                "⭐",
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                "⭐",
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                "⭐",
                                style: TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                          Text("170 Reviews")
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Image.network(
                  "https://bonmasala.com/wp-content/uploads/2022/10/mutton-biriyani-recipe.jpeg",
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                )
              ],
            ),
            _buildListView(),
            _buildImageColumn(),
            _buildStack(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
