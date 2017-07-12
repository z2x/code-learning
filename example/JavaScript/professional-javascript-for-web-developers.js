var myNumber = null;
var myBoolearn = true;

function test() {
  message = "hi";
}

test();
document.write(typeof message + '<br>');
document.write(typeof myNumber + '<br>');
document.write(typeof myBoolearn + '<br>');
document.write(Boolean(message));

if (message) {
  document.write('Value is true + "<br>');
}

var a = 0.05;
var b = 0.25;
if (a + b == 0.3) {
  document.write('you got 0.30. + "<br>');
}

document.write(Number.MIN_VALUE + '<br>');
document.write(Number.MAX_VALUE + '<br>');

var result = Number.MAX_VALUE + Number.MAX_VALUE;
document.write(isFinite(result) + '<br>');
document.write(isNaN(result) + '<br>');
document.write(parseInt(070, 8 + '<br>'));

var o = {
  valueOf: function () {
    return -1;
  }
}
document.write(typeof o + '<br>');

var num = 18;
var Notnum = ~num;
document.write(num.toString(2) + '<br>');
document.write(Notnum.toString(2) + '<br>');

var result = 25 & 24;
document.write(result + '<br>');

var i = 0;
do {
  i += 2;
} while (i < 10);
document.write(i + '<br>');

var y = 0;
while (y < 10) {
  y += 2;
}
document.write(y + '<br>');

switch ("hello world") {
  case "hello world":
    document.write('Greating was found.' + '<br>');
    break;
  case 'goodbye':
    break;
  default:
    document.write('unexpected message was found.');
}

function sayHi(name, message) {
  document.write("hello " + name + "," + message + "<br>");
}
sayHi("zhudi", "How are you?");

function diff(num1, num2) {
  if (num1 < num2) {
    return num2 - num1;
  } else {
    return num1 - num2;
  }
}

diff(5, 4);

function howManyArgs() {
  document.write(arguments.length + "<br>");
}
howManyArgs("strings", 45);
howManyArgs();
howManyArgs(12);

function doAdd(num1, num2) {
  if (arguments.length == 1) {
    document.write(num1 + 10 + "<br>");
  } else if (arguments.length == 2) {
    document.write(num1 + num2 + "<br>");
  }
}

doAdd(10);
doAdd(10, 20);

var person = new Object();
person.name = "zhudi";
name.age = 24;
document.write(person.name + "<br>");
document.write(name.age + "<br>");
document.write(person.name.age + "<br>");

var obj1 = new Object();
var obj2 = obj1;
obj1.name = "zhudi";
document.write(obj2.name + "<br>");

function addTen(num) {
  num += 10;
  return num;
}
var count = 20;
var result = addTen(count);
document.write(count + "<br>");
document.write(result + "<br>");

function setName(obj) {
  obj.name = "doudou";
}

var person = {};
setName(person);
document.write(person.name + "<br>");
document.write(typeof person + "<br>");
document.write(typeof setName + "<br>");

var color = "blue";

function changeColor() {
  if (color == "blue") {
    color = "red";
  } else {
    color = "blue";
  }
}
changeColor();
document.write("color is now " + color + "<br>");

function add(num1, num2) {
  sum = num1 + num2;
  return sum;
}

var result = add(10, 20);
document.write(result + "<br>");
document.write(sum + "<br>");

var color = "blue";
var color;

function getColor() {
  var color = "gray";
  return color;
}
document.write(getColor() + "<br>");

var person = {};
person.name = "apple";
person.age = 29;

var person = {
  name: "apple",
  age: 27,
}

function disPlayInfo(args) {
  var output = "";
  if (typeof args.name == "string") {
    output += "Name: " + args.name + "<br>";
  }
  if (typeof args.age == "number") {
    output += "Age: " + args.age + "<br>";
  }
  document.write(output + "<br>");
}

disPlayInfo({
  name: "apple",
  age: 27,
});

disPlayInfo({
  name: "Greg"
});

var colors = ["red", "blue", "green"];
colors[3] = "black";
document.write(colors.length + "<br>");
colors.length = 2;
document.write(colors[2] + "<br>");
colors[colors.length] = "gray";
document.write(colors[2] + "<br>");
document.write(colors.valueOf() + "<br>");

var person1 = {
  toLocalString: function () {
    return "name1";
  },
  toString: function () {
    return "name2";
  }
};

var person2 = {
  toLocalString: function () {
    return "name3";
  },
  toString: function () {
    return "name4";
  }
};
var people = [person1, person2];
document.write(people.join(" || ") + "<br>");
document.write(people.toLocaleString() + "<br>");
document.write(people.toString() + "<br>");

var colors = [];
var count = colors.push("red", "green");
document.write(count + "<br>");
count = colors.push("black");
document.write(count + "<br>");


var values = [0, 1, 5, 10, 15];
document.write(values.reverse() + "<br>");
document.write(values.sort() + "<br>");

function compare(value1, value2) {
  if (value1 < value2) {
    return -1;
  } else if (value1 > value2) {
    return 1;
  } else {
    return 0;
  }
}
document.write(values.sort(compare) + "<br>");

var colors = ["red", "green", "blue"];
var colors2 = colors.concat("yellow", ["balck", "brown"]);
document.write(colors + "<br>");
document.write(colors2 + "<br>");
document.write(colors2.slice(1) + "<br>");
document.write(colors2.slice(1, 4) + "<br>");
document.write(colors.splice(0, 1) + "<br>");
document.write(colors.splice(1, 0, "yellow", "orange"));
document.write(colors + "<br>");
document.write(colors.indexOf("green") + "<br>");
document.write(colors.lastIndexOf("green") + "<br>");

var numbers = [1, 2, 3, 4, 5, 4, 3, 2, 1];
var everyResult = numbers.every(function (item, index, array) {
  return (item > 2);
});
document.write(everyResult + "<br>");

var someResult = numbers.every(function (item, index, array) {
  return (item > 2);
});
document.write(someResult + "<br>");

var filterResult = numbers.filter(function (item, index, array) {
  return (item > 2);
});
document.write(filterResult + "<br>");

var mapResult = numbers.map(function (item, index, array) {
  return (item * 2);
});
document.write(mapResult + "<br>");

var values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var sum = values.reduce(function (prev, cur, index, array) {
  return prev + cur;
});
document.write(sum + "<br>");

var someDate = new Date(Date.parse("May 25,2017"));
document.write(someDate + "<br>");

var someDate = new Date("May 25,2017");
document.write(someDate + "<br>");

var now = new Date();
document.write(now + "<br>");

var text = "cat,bat,sat,fat";
var pattern1 = /.at/;

var matches = pattern1.exec(text);
document.write(matches.index + "<br>");
document.write(matches[0] + "<br>");
document.write(pattern1.lastIndex + "<br>");

matches = pattern1.exec(text);
document.write(matches.index + "<br>");
document.write(matches[0] + "<br>");
document.write(pattern1.lastIndex + "<br>");

var pattern2 = /.at/g;

var matches = pattern2.exec(text);
document.write(matches.index + "<br>");
document.write(matches[0] + "<br>");
document.write(pattern2.lastIndex + "<br>");

matches = pattern2.exec(text);
document.write(matches.index + "<br>");
document.write(matches[0] + "<br>");
document.write(pattern2.lastIndex + "<br>");


function addSomeNumber(num) {
  return num + 100;
}

function addSomeNumber(num) {
  return num + 200;
}

document.write(addSomeNumber(100) + "<br>");

document.write(sum1(10, 10));

function sum1(num1, num2) {
  return num1 + num2;
}

function callSomeFunction(someFunction, someArgument) {
  return someFunction(someArgument);
}

function add10(num) {
  return num + 10;
}
var result1 = callSomeFunction(add10, 10)
document.write(result1 + "<br>");

function getGreeting(name) {
  return "Hello, " + name + "<br>";
}

var result2 = callSomeFunction(getGreeting, "apple");
document.write(result2 + "<br>");

function createComparisonFunction(propertyName) {
  return function (object1, object2) {
    var value1 = object1[propertyName];
    var value2 = object2[propertyName];
    if (value1 < value2) {
      return -1;
    } else if (value1 > value2) {
      return 1;
    } else {
      return 0;
    }
  };
}

var data = [{
    name: "apple",
    age: 25
  },
  {
    name: "banana",
    age: 21
  }
];

data.sort(createComparisonFunction("name"));
document.write(data[0].name + "<br>");
data.sort(createComparisonFunction("age"));
document.write(data[0].name + "<br>");

window.color = "red";
var o = {
  color: "blue"
};

function sayColor() {
  document.write(this.color + "<br>");
}
sayColor();

o.sayColor = sayColor;
o.sayColor();

function outer() {
  inner();
}

function inner() {
  document.write(inner.caller + "<br>");
}
outer();

document.write(sayColor.length + "<br>");

window.color = "red";
var o = {
  color: "blue"
};

function sayColor() {
  document.write(this.color + "<br>");
}

sayColor.call(this);
sayColor.call(window);
sayColor.call(o);

function add(j, k) {
  return j + k;
}

function sub(j, k) {
  return j - k;
}
add(5, 3); //8
add.call(sub, 5, 3); //8
add.apply(sub, [5, 3]); //8

sub(5, 3); //2
sub.call(add, 5, 3); //2
sub.apply(add, [5, 3]); //2

var array1 = [12, "foo", {
  name: "zhufind"
}, -2048];
var array2 = ["Joe", 555, false];
var myArray = Array.prototype.push.apply(array1, array2);
document.write(myArray + "<br>");

var numbers = [5, 458, 120, -215];
var maxInNumbers = Math.max.apply(Math, numbers), //458
  maxInNumbers = Math.max.call(Math, 5, 458, 120, -215); //458
document.write(maxInNumbers + "<br>");

var minInNumbers = Math.min.apply(Math, numbers);
minInNumbers = Math.min.call(Math, 5, 458, 120, -215);
document.write(minInNumbers + "<br>");

var s1 = new String("hello world!");
var s2 = s1.substring(2, 5);
document.write(s2 + "<br>");

s1.color = "red";
document.write(s1.color + "<br>");

value = "25";
var number = Number(value);
document.write(typeof value + "<br>");
document.write(typeof number + "<br>");

var newNumber = new Number(value);
document.write(typeof newNumber + "<br>");

var textBoolean = new Boolean(false);
var result = textBoolean && true;
document.write(result + "<br>");
document.write(typeof result + "<br>");

var myNumber = new Number(10);
document.write(myNumber.valueOf() + "<br>");

var stringValue = "HHHh,you";
document.write(stringValue.charAt(3) + "<br>");
document.write(stringValue.charCodeAt(1) + "<br>");
document.write(stringValue.charCodeAt(3) + "<br>");
document.write(stringValue[1] + "<br>");

var stringValue = "Ad cupidatat reprehenderit voluptate Lorem ipsum est et velit enim tempor ea quis velit ex.";

var positions = [];
var pos = stringValue.indexOf("e");

while (pos > -1) {
  positions.push(pos);
  pos = stringValue.indexOf("e", pos + 1);
}
document.write(positions + "<br>");

var stringValue = "       hello wolrd!      ";
var newString = stringValue.trim();
document.write(stringValue + "<br>");
document.write(newString + "<br>");
document.write(stringValue.toUpperCase() + "<br>");

var text = "cat,bat,sat,fat";
document.write(text + "<br>");
var pattern = /.at/;
var matches = text.match(pattern);
document.write(matches.index + "<br>");
document.write(matches[0] + "<br>");
var pos = text.search(/at/);
document.write(pos + "<br>");
var result = text.replace("at", "ad");
document.write(result + "<br>");
var newResult = text.replace(/at/g, "ad");
document.write(newResult + "<br>");



function htmlEscape(text) {
  return text.replace(/[<>"&]/g, function (match, pos, originalText) {
    switch (match) {
      case "<":
        return "&lt;";
      case ">":
        return "&gt;";
      case "&":
        return "&amp;";
      case "\"":
        return "&quot;";
    }
  });
}
document.write(htmlEscape("<p class=\"greeting\">Hello World!</p>") + "<br>");

var values = [2,43,-7,54];
var max = Math.max.apply(Math,values);
document.write(max + "<br>");
var max = Math.max.apply(Math,[2,43,-7,54]);
document.write(max + "<br>");