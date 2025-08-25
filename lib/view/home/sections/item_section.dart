part of '../home.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          NotePage.routeName,
          arguments: {'note': note},
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppSize.s12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.lightGrey),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText.label(
              note.title,
              style: TextStyle(fontSize: AppSize.s16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Spacer(),
            RegularText(
              note.content,
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
            ),
          ],
        ),
      ),
    );
  }
}
