import 'package:bchain_assessment/ui/shared/components/_components.dart';
import 'package:bchain_assessment/ui/views/login_view/login_view.dart';
import 'package:bchain_assessment/ui/views/login_view/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/service_helpers.dart';
import '../../helpers/ui_helpers.dart';

class MockLoginViewModel extends Mock implements LoginViewModel {}

void main() {
  setUp(() {
    registerServices();
  });

  testWidgets('finds two textfield widgets and a Continue text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(const LoginView(), MockLoginViewModel()),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AppTextField), findsExactly(2));
    expect(find.text('Continue'), findsOne);
  });

  testWidgets(
      'finds `Email is required` when an continue is tapped without entering an email',
      (WidgetTester tester) async {
    final loginViewModel = MockLoginViewModel();
    when(() => loginViewModel.login())
        .thenAnswer((_) async => loginViewModel.setBusy(true));

    //
    await tester.pumpWidget(
      buildTestableWidget(const LoginView(), loginViewModel),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(AppTextField).first, '');

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Email is required'), findsOne);
  });

  testWidgets(
      'finds `Please enter a valid email` when an invalid email is used to log in',
      (WidgetTester tester) async {
    final loginViewModel = MockLoginViewModel();
    when(() => loginViewModel.login())
        .thenAnswer((_) async => loginViewModel.setBusy(true));

    //
    await tester.pumpWidget(
      buildTestableWidget(const LoginView(), loginViewModel),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(AppTextField).first, 'thisa@cec');

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter a valid email'), findsOne);
  });

  testWidgets(
      'finds `Password is required` when an continue is tapped without entering an email',
      (WidgetTester tester) async {
    final loginViewModel = MockLoginViewModel();
    when(() => loginViewModel.login())
        .thenAnswer((_) async => loginViewModel.setBusy(true));

    //
    await tester.pumpWidget(
      buildTestableWidget(const LoginView(), loginViewModel),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(AppTextField).last, '');

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Password is required'), findsOne);
  });

  testWidgets(
      'finds `Please enter a valid password` when an invalid email is used to log in',
      (WidgetTester tester) async {
    final loginViewModel = MockLoginViewModel();
    when(() => loginViewModel.login())
        .thenAnswer((_) async => loginViewModel.setBusy(true));

    //
    await tester.pumpWidget(
      buildTestableWidget(const LoginView(), loginViewModel),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(AppTextField).last, 'psword');

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter a valid password'), findsOne);
  });
}
