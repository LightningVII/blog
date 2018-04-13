---
title: Javascript 作用域 
date: 2018.04.12
categories: 
    - Javascript
tags:
    - Javascript
    - 菜鸟系列
---
#### 1
``` javascript
Function.prototype.bind = function (context) {
	var self = this;
	return function () {
		self.apply(context);
	}
}
```
#### 2
``` javascript
Function.prototype.bind = Function.prototype.bind || function(context) {
	var that = this;
	return function() {
		return that.apply(context, arguments);
	}
}
```
#### 3
``` javascript
Function.prototype.bind = function (context) {
	var self = this;
	var args = Array.prototype.slice.call(arguments, 1);

	return function () {
		var bindArgs = Array.prototype.slice.call(arguments);
		self.apply(context, args.concat(bindArgs));
	}
}
```
#### 4
``` javascript
Function.prototype.bind = function (context) {
	var self = this;
	var args = Array.prototype.slice.call(arguments, 1);

	var fbound = function () {
		var bindArgs = Array.prototype.slice.call(arguments);
		self.apply(this instanceof self ? this : context, args.concat(bindArgs));
	}
	fbound.prototype = this.prototype;
	return fbound;
}
```
