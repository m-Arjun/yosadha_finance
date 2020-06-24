import 'package:bloc/bloc.dart';
import 'package:yosadha_finance/screens/home/pages/customeradd.dart';
import 'package:yosadha_finance/screens/home/pages/customerdetails.dart';


enum NavigationEvent{
  Welcomepageclick,
  Customeraddclick,
  Customerdetailsclick,
}

abstract class NavigationStates{}

class Navigationbloc extends Bloc<NavigationEvent,NavigationStates>{
  @override
  NavigationStates get initialState => Custadd();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvent event) async*{
    switch(event){
      case NavigationEvent.Welcomepageclick : yield Custadd();break;
      case NavigationEvent.Customeraddclick : yield Custadd();break;
      case NavigationEvent.Customerdetailsclick : yield Custdetails();break;
    }
  }
}
