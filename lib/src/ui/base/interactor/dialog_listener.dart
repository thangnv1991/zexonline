import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/widgets/base/app_dialog.dart';

void dialogListener(state) {
  if (state.pageCommand is PageCommandShowTokenError) {
    showDialogErrorToken();
  }
  if (state.pageCommand is PageCommandShowError) {
    showErrorDialog(state.pageCommand.msg);
  }
}
