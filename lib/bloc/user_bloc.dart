import 'package:flutter_app/model/user_info.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();
  final _infoFetcher = PublishSubject<UserInfo>();

  Observable<UserInfo> get allInformation => _infoFetcher.stream;

  fetchAllInformation() async {
    UserInfo itemModel = await _repository.fetchAllInformation();
    _infoFetcher.sink.add(itemModel);
  }

  dispose() {
    _infoFetcher.close();
  }
}

final bloc = UserBloc();