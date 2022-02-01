String encrypt(String input) {
  var gibber = "fd656.he6/.";
  var gibber2 = 'g46758/*+';

  var password = input.split('').reversed.join();
  var pwd = gibber2 + password + gibber;
  var x1 = pwd.substring(13, pwd.length);
  var x2 = pwd.substring(0, 13);

  var x3 = x1 + x2 + "==";
  var x4 =
      x3.substring(2, x3.length - 2) + x3.substring(x3.length - 2, x3.length);
  return x4;
}
