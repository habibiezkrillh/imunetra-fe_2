import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/views/onboarding/onboarding.dart';
import 'package:front_end/bloc/splash_bloc.dart';
import 'package:front_end/utils/navigator_splash.dart';
import 'package:front_end/services/splash_service.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(SplashService())..add(StartSplash()),
      child: SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (prev, curr) => prev.isCompleted != curr.isCompleted,
      listener: (context, state) {
        if (state.isCompleted) {
          NavigatorHelper.navigateWithFade(context, OnboardingScreen());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final titleFontSize = (constraints.maxWidth * 0.06).clamp(16.0, 32.0);
            final imageWidth = (constraints.maxWidth * 0.6).clamp(100.0, 300.0);

            return Center(
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  return AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: state.opacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          width: imageWidth,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}