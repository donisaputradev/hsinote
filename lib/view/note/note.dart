import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hsinote/app/color.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/bloc/bloc.dart';
import 'package:hsinote/component/component.dart';
import 'package:hsinote/enum/status_enum.dart';
import 'package:hsinote/model/note_model.dart';
import 'package:hsinote/view/home/home.dart';

part 'sections/action_section.dart';
part 'sections/bottom_section.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key, required this.note});

  final NoteModel? note;

  static const String routeName = '/note';

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state.status == StatusEnum.loading) {
          EasyLoading.show(status: 'Loading...');
        }
        if (state.status == StatusEnum.failure) {
          EasyLoading.showToast(state.error.toString());
        }
        if (state.status == StatusEnum.success) {
          EasyLoading.dismiss();

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (_) => false,
          );
        }
      },
      child: Scaffold(
        appBar: RegularAppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSize.s16,
              children: [
                NoteTextInput(
                  controller: titleController,
                  hintText: 'Note title...',
                  style: TextStyle(
                    fontSize: AppSize.s24,
                    fontWeight: FontWeight.w700,
                  ),
                  validator: ValidationBuilder().minLength(1).build(),
                ),
                NoteTextInput(
                  controller: contentController,
                  hintText: 'Write your note here...',
                  style: TextStyle(color: AppColor.grey),
                  validator: ValidationBuilder().minLength(1).build(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _BottomSection(
          key: widget.key,
          updatedAt: widget.note?.updatedAt,
          onCreate: () {
            context.read<NoteBloc>().add(
              CreateNoteEvent(
                title: titleController.text,
                content: contentController.text,
              ),
            );
          },
          onTap: () {
            if (_formKey.currentState?.validate() == true) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return _ActionSection(
                    key: widget.key,
                    id: widget.note!.id,
                    content: contentController.text,
                    title: titleController.text,
                  );
                },
              );
            } else {
              EasyLoading.showToast('Data belum lengkap!');
            }
          },
        ),
      ),
    );
  }
}
