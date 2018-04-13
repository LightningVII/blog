---
title: Javascript 作用域引发的一系列思考
date: 2018.04.12
categories: 
    - Javascript
tags:
    - Javascript
    - 菜鸟系列
---
##### apply & call & 闭包 & 块级作用域
-----------------------------
``` javascript
var nodeList = document.querySelectorAll('ul li')
var colorList = ['red', 'green', 'orange']
```

> freshman  
> colorList.slice(1) --> ['green', 'orange']  
> colorList.slice(-2) --> ['green', 'orange']  
> colorList.slice(1, 2) --> ['green']  
> colorList.splice(2, 1) --> ["orange"]; colorList --> ['red', 'green']  
> Array.isArray(colorList) --> true  
> Array.isArray(nodeList) --> false  
> var arr = Array.from(nodeList); Array.isArray(arr) --> true  
> var arr = [...nodeList]; Array.isArray(arr) --> true  
> var arr = Array.prototype.slice.call(nodeList); Array.isArray(arr) --> true  
> nodeList.slice(1) --> Uncaught TypeError: nodeList.slice is not a function  
> Array.prototype.slice.call(nodeList, 1) --> [li, li]  

``` javascript
nodeList[0].addEventListener('click', function (e) {
  e.target.style.color = colorList[0]
})
nodeList[1].addEventListener('click', function (e) {
  e.target.style.color = colorList[1]
})
nodeList[2].addEventListener('click', function (e) {
  e.target.style.color = colorList[2]
})
```

> sophomore  
> i --> 3  
> colorList[i] --> undefined  

``` javascript
for (var i = 0; i < nodeList.length; i++) {
  nodeList[i].addEventListener('click', function (e) {
    e.target.style.color = colorList[i]
  })
}
```

> junior
> 闭包 

``` javascript
var handleEvent = function (color) {
  return function (e) {
    e.target.style.color = color
  }
}
nodeList[0].addEventListener('click', handleEvent(colorList[0]))
nodeList[1].addEventListener('click', handleEvent(colorList[1]))
nodeList[2].addEventListener('click', handleEvent(colorList[2]))
```

> senior
> console.log(this) --> ```<li>红灯</li>```  
> console.log(this) --> ```<li>绿灯</li>```  
> console.log(this) --> ```<li>黄灯</li>```

``` javascript
var handleEvent = function (color) {
  return function (e) {
    e.target.style.color = color
    console.log(this)
  }
}

for (var i = 0; i < nodeList.length; i++) {
  nodeList[i].addEventListener('click', handleEvent(colorList[i]))
}
```

> ES6 let const 块作用域 箭头函数  
> console.log(this) --> Window  
> colorList[i] --> 'red'  
> colorList[i] --> 'green'  
> colorList[i] --> 'orange'
> const len = nodeList.length 小细节

``` javascript
const len = nodeList.length
for (let i = 0; i < len; i++) {
  nodeList[i].addEventListener('click', e => {
    console.log(this)
    e.target.style.color = colorList[i]
  })
}
```

> ES6 for of array.entries()

``` javascript
const handleEvent = color => e => e.target.style.color = color
const iterator = nodeList.entries();

for (let [i, node] of iterator) {
  node.addEventListener('click', handleEvent(colorList[i]))
}
```
-------------------------
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