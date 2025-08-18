import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hsinote/app/asset.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/regular_text.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/service/user/local_service.dart';
import 'package:hsinote/view/note/note.dart';

part 'sections/empty_section.dart';
part 'sections/item_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();

    checkUser();
  }

  void checkUser() async {
    final user = await UserLocalService.user();

    print(user?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            isEmpty = !isEmpty;
          });
        },
        child: isEmpty
            ? _EmptySection(key: widget.key)
            : SafeArea(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: AppSize.s12,
                  crossAxisSpacing: AppSize.s12,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s16,
                    vertical: AppSize.s20,
                  ),
                  children: [
                    _ItemSection(key: widget.key),
                    _ItemSection(key: widget.key),
                    _ItemSection(key: widget.key),
                  ],
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NotePage.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
