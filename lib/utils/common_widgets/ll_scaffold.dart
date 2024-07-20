import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:screwdriver/screwdriver.dart';

class LLScaffold extends StatelessWidget {
  const LLScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.backButtonVisibility = true,
    this.appBarTitle,
    this.backGroundColor,
    this.scaffoldPadding,
    this.appBarPadding,
    this.onBackTap,
    this.bottomNavigationBar,
    this.actions,
    this.extendBodyBehindAppBar = false,
    this.extendedBody = false,
    this.safeAreaBottom = true,
    this.safeAreaTop = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.enableSafeArea = true,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
  });

  final Widget body;
  final Widget? appBar;
  final bool backButtonVisibility;
  final String? appBarTitle;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? scaffoldPadding;
  final EdgeInsetsGeometry? appBarPadding;
  final GestureTapCallback? onBackTap;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final bool extendBodyBehindAppBar;
  final bool extendedBody;
  final bool safeAreaBottom;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool enableSafeArea;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backGroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        bottom: enableSafeArea && safeAreaBottom,
        top: enableSafeArea && safeAreaTop,
        left: enableSafeArea && safeAreaLeft,
        right: enableSafeArea && safeAreaRight,
        child: Scaffold(
          backgroundColor:
              backGroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          extendBody: extendedBody,
          appBar: appBar != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: appBarPadding ??
                        const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                    child: const SizedBox(),
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: AppBar(
                    centerTitle: centerTitle,
                    backgroundColor: context.themeColor.appbarBackgroundColor,
                    automaticallyImplyLeading: automaticallyImplyLeading,
                    leading: backButtonVisibility
                        // TODO(Janak): Add custom view here
                        ? InkWell(
                            onTap: onBackTap ??
                                (navigation.canPop ? navigation.pop : null),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                            ),
                          )
                        : null,
                    title: appBarTitle.isNotNullOrBlank
                        ? Text(
                            appBarTitle!,
                            style: context.textStyleTheme.bodyXLargeSemiBold
                                ?.copyWith(fontWeight: FontWeight.w500),
                          )
                        : null,
                  ),
                ),
          body: Padding(
            padding: scaffoldPadding ?? EdgeInsets.zero,
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
