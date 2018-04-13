### javascript 引用类型
  指向对象的指针而不是对象本身，赋值的时候，只是创建了一个新的指针指向对象。保存在堆内存中。
  优点:省内存

### 为什么要实践 “不可变数据”
  在复杂的业务场景下，由于对象是被引用的，导致数据变的“不可预见”，如何理解数据 “可预见”，个人的理解是对数据变化的监控度，由于多处引用，造成数据难以还原，甚至有需求是还原到某一次操作后的数据，这时候数据的变化难以追溯，也就是我理解的 “不可预见”

### 为什么使用Immutable 
###### 由于引用类型的优点，如果都使用深拷贝的方式创建对象，无疑会增大内存的开销。
  - Immutable 三大特性
	  - Persistent data structure （持久化数据结构）
	  - structural sharing （结构共享）
	  - support lazy operation （惰性操作）
  - 个人理解
  
  比如 原始数据 
  		
  		var person = { name: "阿策", age: 25 }
  变化的目标数据是 
  
  		{ name: "阿策", age: 25, parent: { father: "Gang", mother: "Ying" } }
  		
  那么 Immutable 会存一个 
  
  		var personParent = {parent: { father: "Gang", mother: "Ying" } }
  		
  返回的结果
  		
  		_.merge(person, personParent)