
String encrypt(String input) {
  var gibber = "fd656.he6/.";
  var gibber2 = "g46758/*+";
  var item2 = input.split('').reversed.join();
  var pwd = gibber2 + item2;
  var item3 = pwd.toUpperCase();
  var item4 = item3 + gibber;
  var x1=pwd.substring(13,item4.length);
  var x2=pwd.substring(0,13);

  return x1+x2+"==";
}

