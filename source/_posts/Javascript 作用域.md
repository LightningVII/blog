---
title: Javascript 作用域 
date: 2018.04.12
categories: 
    - Javascript
tags:
    - Javascript
    - 菜鸟系列
---

##### apply & call & 闭包 & 块级作用域

``` javascript
Function.prototype.bind = function (context) {
  var that = this;
  return function () {
    that.apply(context);
  }
}
```

``` javascript
Function.prototype.bind = Function.prototype.bind || function(context) {
  var that = this;
  return function() {
    return that.apply(context, arguments);
  }
}
```

``` javascript
Function.prototype.bind = function (context) {
  var that = this;
  var args = Array.prototype.slice.call(arguments, 1);

  return function () {
    var bindArgs = Array.prototype.slice.call(arguments);
    that.apply(context, args.concat(bindArgs));
  }
}
```

``` javascript
Function.prototype.bind = function (context) {
  var that = this;
  var args = Array.prototype.slice.call(arguments, 1);

  var fbound = function () {
    var bindArgs = Array.prototype.slice.call(arguments);
    that.apply(this instanceof that ? this : context, args.concat(bindArgs));
  }
  fbound.prototype = this.prototype;
  return fbound;
}
```

``` javascript
Function.prototype.bind = Function.prototype.bind || function (context, ...formerArgs) {
  let that = this;

  if (typeof this !== 'function') {
    throw new TypeError("NOT_A_FUNCTION -- this is not callable");
  }
  let fNOP = function () {}; 

  let fbound = function (...laterArgs) {
    that.apply(this instanceof that ? this : context, formerArgs.concat(laterArgs));
  };

  fNOP.prototype = this.prototype;
    
  fbound.prototype = new fNOP();
  return fbound;
};
```