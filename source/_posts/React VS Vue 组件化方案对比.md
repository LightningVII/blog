## 在使用 Vue 和 React 两大流行框架时的部分对比总结

### 木偶组件
  - 作用: 类似传统的模版引擎(Handlebars, underscore: _template)
  - React 中使用灵活的 jsx 语法实现
  - Vue 中借助 filter,computed 类似 Handlebars 的 helper 实现功能

### 父子通讯
  - Vue: 单向数据流的思想，props 父 => 子，$emit 子 => 父
  - React: props 父 => 子, 子 => 父 直接触发 父组件传递过来的方法，同样是数据同样是单向的, 父组件调用子组件的方法，是通过 父组件传递给自组件方法，子组件触发父组件传递过来的方法时，把需要 父组件执行的 子组件的方法 传递到 父组件回调中。

### models
  - props 不可变
  - state 可变 (vue data)