enum StoryType {
  Comic,
  Novel,
  Audio;
}

StoryType getStoryType(String? value) {
  switch (value) {
    case 'audio':
      return StoryType.Audio;
    case 'story':
      return StoryType.Novel;
    default:
      return StoryType.Comic;
  }
}
