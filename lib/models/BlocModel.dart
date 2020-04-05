/// description: 
/// project: de_wallet_vendor
/// @package: models
/// @author: dammyololade
/// created on: 04/04/2020
class BlocModel<T>{
  List<T> model;
  bool processing;
  BlockAction action;
  T baseModel;

  BlocModel({this.model, this.processing, this.action, this.baseModel});
}

enum BlockAction{
  LoadMore,
  Search,
  Fetch,
  Refresh,
  Filter,
  Done,
}