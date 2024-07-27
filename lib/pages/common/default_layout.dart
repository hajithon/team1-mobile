import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';

/// Default Layout은 모든 Screen에 공통적으로 래핑되는 Layout입니다.
/// 만약 모든 페이지에 공통으로 적용되는 변화 사항이 있을 경우 `DefaultLayout`에서 수정하세요.
/// DefaultLayout에서 없는 기능을 추가하고자 하는 경우, nullable 옵션으로 추가하세요.
class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const DefaultLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: _renderDefaultAppBar(title: title),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

AppBar _renderDefaultAppBar({
  String? title,
}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title ?? '',
      style: TextStyles.titleTextStyle.copyWith(
        fontSize: 20.0,
      ),
    ),
    foregroundColor: Colors.black,
  );
}
