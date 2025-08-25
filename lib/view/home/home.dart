import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hsinote/app/asset.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/bloc/bloc.dart';
import 'package:hsinote/component/component.dart';
import 'package:hsinote/enum/status_enum.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/model/note_model.dart';
import 'package:hsinote/view/login/login.dart';
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
  @override
  void initState() {
    super.initState();

    context.read<NoteBloc>().add(GetNoteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == StatusEnum.initial) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.routeName,
            (_) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Text(state.user?.name ?? '');
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutAuthEvent());
              },
              icon: Icon(Icons.exit_to_app_rounded),
              color: AppColor.red,
            ),
          ],
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state.notes.isEmpty) {
              return _EmptySection(key: widget.key);
            }
            return SafeArea(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: AppSize.s12,
                crossAxisSpacing: AppSize.s12,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s16,
                  vertical: AppSize.s20,
                ),
                children: List.generate(state.notes.length, (index) {
                  return _ItemSection(
                    key: widget.key,
                    note: state.notes[index],
                  );
                }),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, NotePage.routeName);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
