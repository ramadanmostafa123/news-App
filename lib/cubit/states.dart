abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewschangeBottomNav extends NewsStates {}

class GetBuisnessloadingState extends NewsStates {}

class GetBuisnessSuccessState extends NewsStates {}

class GetBuisnessErrorState extends NewsStates {
  final String error;

  GetBuisnessErrorState(this.error);
}

class GetScienceloadingState extends NewsStates {}

class GetScienceSuccessState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String error;

  GetScienceErrorState(this.error);
}

class GetSportsloadingState extends NewsStates {}

class GetSportsSuccessState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final String error;

  GetSportsErrorState(this.error);
}

class GetSearchloadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final String error;

  GetSearchErrorState(this.error);
}
