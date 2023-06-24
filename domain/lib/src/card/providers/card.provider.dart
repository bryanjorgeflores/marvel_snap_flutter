import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class CardProvider {
  ApiProvider apiProvider;

  CardProvider(this.apiProvider);

  getCards() {
    return apiProvider.get('/getinfo/?searchtype=cards&searchcardstype=true');
  }
}
