import 'package:flutter/material.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/note_text_input.dart';
import 'package:hsinote/component/regular_app_bar.dart';
import 'package:hsinote/component/regular_text.dart';

part 'sections/action_section.dart';
part 'sections/bottom_section.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  static const String routeName = '/note';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegularAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSize.s16,
          children: [
            NoteTextInput(
              hintText: 'Note title...',
              style: TextStyle(
                fontSize: AppSize.s24,
                fontWeight: FontWeight.w700,
              ),
            ),
            NoteTextInput(
              hintText: 'Write your note here...',
              minLines: 5,
              style: TextStyle(color: AppColor.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomSection(key: key),
    );
  }
}
