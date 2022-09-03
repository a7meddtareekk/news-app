abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}
class NewsChangeBottomNavStates extends NewsStates{}
class NewsBusinessLoadingStates extends NewsStates{}
class NewsBusinessSuccessStates extends NewsStates{}
class NewsBusinessErrorStates extends NewsStates{}

class NewsSportsLoadingStates extends NewsStates{}
class NewsSportsSuccessStates extends NewsStates{}
class NewsSportsErrorStates extends NewsStates{}

class NewsScienceLoadingStates extends NewsStates{}
class NewsScienceSuccessStates extends NewsStates{}
class NewsScienceErrorStates extends NewsStates{}

class NewsSearchLoadingStates extends NewsStates{}
class NewsSearchSuccessStates extends NewsStates{}
class NewsSearchErrorStates extends NewsStates{
  final String Error;

  NewsSearchErrorStates(this.Error);
}

