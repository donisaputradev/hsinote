part of '../note.dart';

class _BottomSection extends StatelessWidget {
  const _BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s16,
                  vertical: AppSize.s12,
                ),
                child: RegularText('Last edited on 19.30'),
              ),
            ),
            GestureDetector(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(AppSize.s12),
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return _ActionSection(key: key);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
