条件推理树

条件推理树（ctree）是另一种比较常用的基于树的分类算法。两者的不同之处是，条件推理树是选择分类变量时的依据是显著性测量的结果，而不是采用信息最大化法（rpart采用的是基尼系数）。

首先安装并加载Ctree()所在程序包：

    install.packages('party')
    library(party)

然后大概看一下我们要用到的R自带的著名iris数据集：

    head(iris)

结果显示：

    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    1          5.1         3.5          1.4         0.2  setosa
    2          4.9         3.0          1.4         0.2  setosa
    3          4.7         3.2          1.3         0.2  setosa
    4          4.6         3.1          1.5         0.2  setosa
    5          5.0         3.6          1.4         0.2  setosa
    6          5.4         3.9          1.7         0.4  setosa

然后ctree()函数上阵，第一个变量是目标变量，后面用加号连在一起的是输入变量，数据集为iris，请对号入座。

    cluster_iris<-ctree(Species~Sepal.Length Sepal.Width Petal.Length Petal.Width,data=iris)

看一下结果：

    Conditional inference tree with 4 terminal nodes
    Response:  Species
    Inputs:  Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
    Number of observations:  150
    1) Petal.Length <= 1.9; criterion = 1, statistic = 140.264
      2)*  weights = 50
    1) Petal.Length > 1.9
      3) Petal.Width <= 1.7; criterion = 1, statistic = 67.894
        4) Petal.Length <= 4.8; criterion = 0.999, statistic = 13.865
          5)*  weights = 46
        4) Petal.Length > 4.8
          6)*  weights = 8
      3) Petal.Width > 1.7
        7)*  weights = 46

做图：从图中可以看出节点2、5和7分类效果都不错。

    plot(cluster_iris)
 
参考资料
[1]:http://blog.sina.com.cn/s/blog_b13eaab20102y6wr.html (只要内容基本引用的这篇文章)
[2]:http://blog.csdn.net/dingming001/article/details/72864001 (今后在如何修剪简洁的树的思路可以从这篇文章中寻找) 
