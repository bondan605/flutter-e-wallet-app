
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topup_event.dart';

part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      try {
        if (event is TopupPost) {
          emit(TopupLoading());
          final redirectUrl = await TransactionService().topUp(event.data);
          emit(TopupSuccess(redirectUrl));
        }
      } catch (e) {
        emit(TopupFailed(e.toString()));
      }
    });
  }
}
