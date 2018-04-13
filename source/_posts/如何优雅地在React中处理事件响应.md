# 如何优雅地在React中处理事件响应
- 将事件写在元素中，缺点：可读性差，耦合严重，元素重新渲染，会导致方法重新创建

####

	render() {
	  return (
	    <button onClick={()=>{console.log('button clicked');}}>
	      Click
	    </button>
	  );
	}
- 事先定义方法，将方法与元素抽离，缺点：点击事件会重新被创建

####

	class MyComponent extends React.Component {
	  constructor(props) {
	    super(props);
	    this.state = {number: 0};
	  }
	
	  handleClick() {
	    this.setState({
	      number: ++this.state.number
	    });
	  }
	
	  render() {
	    return (
	      <div>
	        <div>{this.state.number}</div>
	        <button onClick={()=>{this.handleClick();}}>
	          Click
	        </button>
	      </div>
	    );
	  }
	}
- 点击事件引用定义好的方法，缺点：如果需要用到当前Component对象，需要手动 bind(this)

####

	class MyComponent extends React.Component {
	  constructor(props) {
	    super(props);
	    this.state = {number: 0};
	    this.handleClick = this.handleClick.bind(this);
	  }
	
	  handleClick() {
	    this.setState({
	      number: ++this.state.number
	    });
	  }
	
	  render() {
	    return (
	      <div>
	        <div>{this.state.number}</div>
	        <button onClick={this.handleClick}>
	          Click
	        </button>
	      </div>
	    );
	  }
	}

###### 或者使用尖头函数
	
	export default class CartItem extends React.Component {
	
	    constructor(props) {
	        super(props);
	        this._increaseQty = () => this.increaseQty();
	    }
	
	    render() {
	        <button onClick={_this.increaseQty} className="button success">+</button>
	    }
	}
		
- 使用 ES7 property initializers

######

	export default class CartItem extends React.Component {
  
	    increaseQty = () => this.increaseQty();
	
	    render() {
	        <button onClick={this.increaseQty} className="button success">+</button>
	    }
	}
		
- 使用 :: 很帅的写法，不过个人认为可读性不好，(如果不是 => 可以bind(this), 个人并不太喜欢，不习惯，容易看错)

######

	export default class CartItem extends React.Component {
    
    	constructor(props) {
       		super(props)
        	this.increaseQty = ::this.increaseQty;
	    }
	
	    render() {
	        <button onClick={this.increaseQty} className="button success">+</button>
	    }
	}
###### 或者更帅的写法
	
	export default class CartItem extends React.Component {
	    render() {
	        <button onClick={::this.increaseQty} className="button success">+</button>
	    }
	}
		
[如何优雅地在React中处理事件响应](http://blog.csdn.net/xuchaobei123/article/details/73477234?ref=myread)

[React and ES6 - Part 3, Binding to methods of React class (ES7 included)](http://egorsmirnov.me/2015/08/16/react-and-es6-part3.html)
