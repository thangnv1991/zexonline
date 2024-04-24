import 'package:zexonline/src/enums/enum_dialog.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/ui/routing/pop_result.dart';

abstract class PageCommand {}

class PageCommandShowToast extends PageCommand {
  String msg;

  PageCommandShowToast(this.msg);
}

class PageCommandShowError extends PageCommand {
  String msg;

  PageCommandShowError(this.msg);
}

class PageCommandShowSuccess extends PageCommand {
  String msg;

  PageCommandShowSuccess(this.msg);
}

class PageCommandShowTokenError extends PageCommand {
  PageCommandShowTokenError();
}

class PageCommandShowWarning extends PageCommand {
  PageCommandShowWarning();
}

class PageCommandShowBottomSheet extends PageCommand {
  final SheetType sheetType;
  final dynamic argument;

  PageCommandShowBottomSheet({required this.sheetType, this.argument});
}

class PageCommandNavigatorPage extends PageCommand {
  String page;
  dynamic argument;
  PopResult? result;

  PageCommandNavigatorPage({required this.page, this.result, this.argument});
}

class PageCommandDialog extends PageCommand {
  final DialogType type;
  final dynamic argument;

  PageCommandDialog({required this.type, this.argument});
}
