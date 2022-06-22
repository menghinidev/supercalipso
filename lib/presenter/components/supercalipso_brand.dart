import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class SuperCalipsoBrand extends StatefulWidget {
  const SuperCalipsoBrand({Key? key}) : super(key: key);

  @override
  State<SuperCalipsoBrand> createState() => _SuperCalipsoBrandState();
}

class _SuperCalipsoBrandState extends State<SuperCalipsoBrand> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double headerHeight = 0.0;
  final headerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    ));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      var headerContext = headerKey.currentContext;
      if (headerContext == null) return;
      if (headerContext.size == null) return;
      headerHeight = headerContext.size!.height;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 100)).then((value) => controller.forward());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      child: LayoutBuilder(
        builder: (context, constr) => AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                key: headerKey,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.mediumSize, vertical: Dimensions.smallSize),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'S',
                        style: baseStyle(context).copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'uper',
                        style: baseStyle(context).copyWith(fontWeight: FontWeight.w200),
                      ),
                      TextSpan(
                        text: ' C',
                        style: baseStyle(context).copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'alipso',
                        style: baseStyle(context).copyWith(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  style: baseStyle(context),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: constr.maxWidth * animation.value,
                height: headerHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle baseStyle(BuildContext context) =>
      GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme).displayMedium!.copyWith(
            color: AppColors.blue,
          );
}
