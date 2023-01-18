abstract class AppStates {}

class AppInitialStates extends AppStates{}

class AppChangButtonNavStates extends AppStates{}

class AppLoadingStates extends AppStates{}

class AppSuccessStates extends AppStates{}

class AppErrorStates extends AppStates{

  final error;
  AppErrorStates(this.error);
}
