---
title: MongoDB 笔记
date: 2016.04.12
categories: 
    - MongoDB
tags:
    - 笔记
---
#####当前库
	db
	
#####翻页
	it

#####操作库
	use ['db']
	
#####删除库
	db.dropDatabase()

#####查询库
	show dbs

#####查询表
	show collections || tables

#####销毁表
	db[collections].drop()

#####find
	db[collections].find()
	
#####find condition
	db[collections].find({name: 'robinson.cheng'})

#####gt gte lt lte
	db[collections].find({ rate: { $lt: 9.2, $gte: 9 } })
	
#####in
	db[collections].find({ summary: { $in: [null] } })
	{ "_id" : ObjectId("544db3565d92133398a80daa"), "a" : 1, "summary" :null}
	{ "_id" : ObjectId("5448ac1d735969c5f8386958"), "a" : 4 }
	
#####exists
	db[collections].find({name:{$in:[null],$exists:true}})
	{ "_id" : ObjectId("544db3565d92133398a80daa"), "a" : 1, "summary" :null}
	
#####not null
	db[collections].find({summary:{$ne:null}})
	{ "_id" : ObjectId("544db3b45d92133398a80dab"), "a" : 1, "summary" : "zzz" }

#####select fields
	db[collections].find({}, { key: 1, video: 1 })
	
#####update()
	db.users.update({phoneNumber: '17612179125'}, {$set:{password: '920Ace125'}})
	
#####param3 bool (upsert default false) param4 bool (批量 default false)
	db.users.update({}, {$set:{password: '920Ace125'}}, true, true)

#####remove()
	db.users.remove({nickname:null})

#####getIndexes
	db['articles'].getIndexes()
#####db['articles'].createIndex({'$**':'text'})
#####db['articles'].find({$text:{$search:'aa'}})


	db['articles'].find({$text:{ $search:'aa bb'}}, {score:{$meta:'textScore'}}).sort({score:{$meta:'textScore'}})






	db.articles.insert({ "title" : "aa bb cc", "author" : "白小明", "article" : "这是白小明的一篇文章，标题《aa bb cc》" })
	db.articles.insert({ "title" : "abc def", "author" : "白小明", "article" : "这是白小明的一篇文章，标题《aa bb cc》" })
	db.articles.insert({ "title" : "aa bb", "author" : "白小明", "article" : "这是白小明的一篇文章，标题《aa bb cc》" })
	
	
	var persons = [{name:"robinson.cheng",age:25,email:"robinson.cheng@qq.com",score:{c:89,m:96,e:87},country:"USA",books:["JS","C++","EXTJS","MONGODB"]},{name:"tom.tong",age:25,email:"tom.tong@qq.com",score:{c:75,m:66,e:97},country:"USA",books:["PHP","JAVA","EXTJS","C++"]},{name:"jerry.liu",age:26,email:"jerry.liu@qq.com",score:{c:75,m:63,e:97},country:"USA",books:["JS","JAVA","C#","MONGODB"]},{name:"henry.ye",age:27,email:"henry.ye@qq.com",score:{c:89,m:86,e:67},country:"China",books:["JS","JAVA","EXTJS","MONGODB"]},{name:"lisi",age:26,email:"lisi@qq.com",score:{c:53,m:96,e:83},country:"China",books:["JS","C#","PHP","MONGODB"]},{name:"fred.shu",age:27,email:"fred.shu@qq.com",score:{c:45,m:65,e:99},country:"China",books:["JS","JAVA","C++","MONGODB"]},{name:"jason.wu",age:27,email:"jason.wu@qq.com",score:{c:99,m:96,e:97},country:"China",books:["JS","JAVA","EXTJS","PHP"]},{name:"david.xiao",age:26,email:"david.xiao@dbsupport.cn",score:{c:39,m:54,e:53},country:"Korea",books:["JS","C#","EXTJS","MONGODB"]},{name:"frank.hu",age:27,email:"frank.hu@dbsupport.cn",score:{c:35,m:56,e:47},country:"Korea",books:["JS","JAVA","EXTJS","MONGODB"]},{name:"joe.zhou",age:21,email:"joe.zhou@dbsupport.cn",score:{c:36,m:86,e:32},country:"Korea",books:["JS","JAVA","PHP","MONGODB"]},{name:"steve.tang",age:22,email:"steve.tang@dbsupport.cn",score:{c:45,m:63,e:77},country:"Korea",books:["JS","JAVA","C#","MONGODB"]}]
	for(var i = 0;i<persons.length;i++){
	    db.persons.insert(persons[i])
	}
	
	
