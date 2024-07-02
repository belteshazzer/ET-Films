enum Genre {
  romance,
  action,
  documentary,
  commedy,
  actionCommedy,
  drama,
  romanticComedy,
}

Genre genreFromString(String genreString) {
  switch (genreString.toLowerCase()) {
    case 'romance':
      return Genre.romance;
    case 'action':
      return Genre.action;
    case 'documentary':
      return Genre.documentary;
    case 'comedy':
      return Genre.commedy;
    case 'drama':
      return Genre.drama;
    case 'action_comedy':
      return Genre.actionCommedy;
    case 'romantic comedy':
      return Genre.romanticComedy;
    default:
      throw ArgumentError('Unknown genre: $genreString');
  }
}

