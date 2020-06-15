import 'package:bloc/bloc.dart';
import 'package:yosadha_finance/screens/home/pages/customeradd.dart';
import 'package:yosadha_finance/screens/home/pages/customerdetails.dart';
import 'package:yosadha_finance/screens/home/pages/welcome.dart';

enum NavigationEvent{
  Welcomepageclick,
  Customeraddclick,
  Customerdetailsclick,
}

abstract class NavigationStates{}

class Navigationbloc extends Bloc<NavigationEvent,NavigationStates>{
  @override
  NavigationStates get initialState => Welcome();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvent event) async*{
    switch(event){
      case NavigationEvent.Welcomepageclick : yield Welcome();break;
      case NavigationEvent.Customeraddclick : yield Custadd();break;
      case NavigationEvent.Customerdetailsclick : yield Custdetails();break;
    }
  }
}
