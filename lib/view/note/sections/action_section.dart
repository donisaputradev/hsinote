part of '../note.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection({
    super.key,
    required this.content,
    required this.id,
    required this.title,
  });

  final String id;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(AppSize.s4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.lightGrey,
                    ),
                    child: Icon(Icons.close_rounded, size: AppSize.s20),
                  ),
                ),
              ],
            ),
            buildTile(
              icon: Icons.check_rounded,
              label: 'Mark as Finished',
              onTap: () {
                context.read<NoteBloc>().add(
                  UpdateNoteEvent(id: id, title: title, content: content),
                );
              },
            ),
            Divider(),
            buildTile(
              icon: Icons.delete_rounded,
              label: 'Delete Note',
              color: AppColor.red,
              onTap: () {
                context.read<NoteBloc>().add(DeleteNoteEvent(id));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile({
    required IconData icon,
    required String label,
    Color? color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s8,
          vertical: AppSize.s16,
        ),
        child: Row(
          spacing: AppSize.s16,
          children: [
            Icon(icon, color: color),
            Expanded(
              child: RegularText.label(label, style: TextStyle(color: color)),
            ),
          ],
        ),
      ),
    );
  }
}
