abstract class DeepLink {
  DeepLinkAction type;

  DeepLink(this.type);
}

class SystemNoticeDeepLink extends DeepLink {
  SystemNoticeDeepLink() : super(DeepLinkAction.SYSTEM_NOTICE);
}

enum DeepLinkAction {
  SYSTEM_NOTICE,
}
