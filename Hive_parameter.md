# Hive parameter adjustment explanation
```set hive.auto.convert.join = true;```
<br>
启用自动转换为MapJoin（内存中的Join），当表较小时可以提高Join操作的性能。
<br>
```set hive.input.format=org.apache.hadoop.hive.ql.io.CombineHiveInputFormat;```
<br>
使用CombineHiveInputFormat来读取数据，这种格式可以将小文件合并成一个大文件来处理，从而减少Map任务的数量，提高效率。
<br>
```set hive.hadoop.supports.splittable.combineinputformat=true;```
<br>
允许CombineHiveInputFormat格式支持可分割的输入文件，这样可以更好地利用Hadoop的并行处理能力。
<br>
```set mapred.max.split.size=256000000;```
<br>
设置Map任务处理的最大输入分片大小为256MB。
<br>
```set mapred.min.split.size.per.node=256000000;```
<br>
设置每个节点上Map任务处理的最小输入分片大小为256MB。
<br>
```set mapred.min.split.size.per.rack=256000000;```
<br>
设置每个机架上Map任务处理的最小输入分片大小为256MB。
<br>
```set hive.merge.size.per.task =256000000;```
<br>
设置每个合并任务的目标文件大小为256MB。
<br>
```set hive.merge.mapfiles=true;```
<br>
启用在Map阶段合并小文件。
<br>
```set hive.merge.mapredfiles = true;```
<br>
启用在MapReduce阶段合并小文件。
<br>
```set hive.merge.smallfiles.avgsize=256000000;```
<br>
设置合并小文件的平均大小阈值为256MB，当文件小于这个大小时会被合并。
<br>
```set hive.exec.parallel=true;```
<br>
启用Hive查询的并行执行。
<br>
```set hive.exec.parallel.thread.number=32;```
<br>
指定同一个SQL查询允许并行运行的最大线程数为32。
<br>
```set hive.support.concurrency=false;```
<br>
禁用Hive的事务并发支持。
<br>
```set hive.optimize.index.filter=false;```
<br>
禁用索引过滤优化，以解决在使用UNION ALL时可能出现的数据关联不上问题。
<br>
```set hive.optimize.cte.materialize.threshold=2;```
<br>
设置Common Table Expressions（CTE）物化的阈值为2，即当CTE被引用超过2次时，Hive会将其物化到内存中以避免重复计算。
