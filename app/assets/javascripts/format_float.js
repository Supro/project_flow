function formatFloat(number) {
  var spl = number.toString().split('.');
  var integer = spl[0];

  var size = integer.length;

  if (size == 1) {
    return [integer, decimal].join(',');
  };

  var result = '';
  var mod = size % 3;

  if (mod == 0) { mod = 3; };

  for (var i = 0; i < size; i ++) {
    result += integer[i];

    mod --;

    if (mod == 0) {
      result += ' ';
      mod = 3;
    };
  };

  result = result.slice(0, -1);

  return result;
}