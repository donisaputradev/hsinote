part of '../note.dart';

class _BottomSection extends StatelessWidget {
  const _BottomSection({
    super.key,
    required this.onTap,
    required this.onCreate,
    required this.updatedAt,
  });

  final VoidCallback onTap;
  final VoidCallback onCreate;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: SafeArea(
        child: updatedAt != null
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s16,
                        vertical: AppSize.s12,
                      ),
                      child: RegularText(
                        'Last edited on ${updatedAt?.hour}:${updatedAt?.minute}',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(AppSize.s12),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: TextButton(
                  onPressed: onCreate,
                  child: Text('Mark as Finished'),
                ),
              ),
      ),
    );
  }
}
