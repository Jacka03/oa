# 简介
一个只有对简单数据进行CURD的oa_system

### 使用技术
- IOC容器：Spring
- Web框架：SpringMVC
- ORM框架：Mybatis
- 数据源：druid

### 运行环境和所需工具       
- 开发工具：IntelliJ IDEA
- 项目构建工具：Maven
- 数据库：Mysql
- JDK版本：jdk1.8
- Tomcat版本：Tomcat8.x

### 初始化项目

- 在你的Mysql中，创建一个数据库名称为 oadb 的数据库，并导入我提供的 `sql/oadb.sql` 文件。(数据库个别表名、个别表的属性名更改了。)
- 进入`src/main/resources`修改`jdbc.properties`配置文件,更改数据库driver,url,username和password，改为你自己的。
- `data.properties`文件第一个值，那是分页查询中每页的数量，可自行更改；`filepath`是保存上传图片的路径（最好不要有中文，省很多麻烦），最好放在`/src/main/webapp/assets/img/`下，因为创建的数据库中有一些图片在里面，也可以将这些图片复制到自己创建的文件夹下。
- 使用 IntelliJ IDEA 导入项目，选择Maven项目选项，一路点击next就行，导入项目后，如果src目录等，都没显示出来，别急先使用Maven构建该项目。
- 在 IntelliJ IDEA 中，配置我们的 Tomcat， 然后把使用Maven构建好的项目添加到Tomcat中。
- 运行。

注：
- 上窜的图片存储的路径：`E:\code\实训\file`，在`UserController.java`中的`insertUser`方法可更改。
- 如果更改了上面的路径，就要更改每个以index.jsp结尾的文件，更改`src="assets/img/ui-sam.jpg`为`E:/code/实训/file/{NowUser.filename}`
- 
![img.png](img.png)


### 功能模块

四个模块的CRUD操作中，还缺员工模块所有操作，部门和岗位模块的查找操作。


### 更改
EmployeeController.java功能没写，写了最终也会合并到UserController中

### 想更改
总觉得没必要在dao层，service层将对user、dept、job的操作分开对个java文件。毕竟都没有分管理员和普通用户