part of '../home.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lightGrey),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Column(
        children: [
          RegularText.label(
            '💡 New Product Idea Design 1',
            style: TextStyle(fontSize: AppSize.s16),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Spacer(),
          RegularText(
            'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement. '
            'There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.',
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
