

// Project imports:
import 'credits_data_event.dart';

class GetCreditDataEvent extends CreditsDataEvent{
  GetCreditDataEvent({required this.index});
  final int index;
}
