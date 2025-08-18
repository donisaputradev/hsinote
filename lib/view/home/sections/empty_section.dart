part of '../home.dart';

class _EmptySection extends StatelessWidget {
  const _EmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          children: [
            SvgPicture.asset(AppAsset.homeSvg),
            AppSize.s32.height,
            RegularText.title(
              'Start Your Journey',
              textAlign: TextAlign.center,
            ),
            AppSize.s16.height,
            RegularText(
              'Every big step start with small step. '
              'Notes your first idea and start your journey!',
              textAlign: TextAlign.center,
            ),
            AppSize.s70.height,
            SvgPicture.asset(AppAsset.arrowSvg),
          ],
        ),
      ),
    );
  }
}
