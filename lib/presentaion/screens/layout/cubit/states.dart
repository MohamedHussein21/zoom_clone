
abstract class LayoutStates {}

class LayoutInitialStates extends LayoutStates{}

class LayoutChangButtonNavStates extends LayoutStates{}

class LayoutLoadingHomeDataStates extends LayoutStates{}

class LayoutHomeDataSuccessStates extends LayoutStates{}

class LayoutHomeDataErrorStates extends LayoutStates{

  final error;
  LayoutHomeDataErrorStates(this.error);
}

