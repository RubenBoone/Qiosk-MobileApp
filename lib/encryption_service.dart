
String encrypt(String input) {
  var gibber = "fd656.he6/.";
  var gibber2 = "g46758/*+";
  var item2 = input.split('').reversed.join();
  var pwd = gibber2 + item2;
  var item3 = pwd.toUpperCase();
  var item4 = item3 + gibber;
  return item4;
}

