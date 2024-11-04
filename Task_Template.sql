--********************************************************************--
-- 任务描述: 中文任务名 库名.英文任务名
-- 需求人员: 
-- 需求文档: 
-- 创建日志: 2024-09-03 huangweicong1 新建任务
-- 变更日志：
--********************************************************************--

-- DDL区域
-- (
--      etl_time                             timestamp   comment '数据计算时间',
-- )
-- comment ''
-- partitioned by (dt string comment '天分区')	

  
-- 调参区域
set hive.auto.convert.join = true;  --自动化 MapJoin
set hive.input.format=org.apache.hadoop.hive.ql.io.CombineHiveInputFormat;
set hive.hadoop.supports.splittable.combineinputformat=true;
set mapred.max.split.size=256000000;
set mapred.min.split.size.per.node=256000000;
set mapred.min.split.size.per.rack=256000000;
set hive.merge.size.per.task =256000000;
set hive.merge.mapfiles=true;
set hive.merge.mapredfiles = true;
set hive.merge.smallfiles.avgsize=256000000;
set hive.exec.parallel=true;
set hive.exec.parallel.thread.number=32; --指定同一个sql允许并行运行的最大线程数。
set hive.support.concurrency=false;
set hive.optimize.index.filter=false; -- 解决union all出现数据关联不上问题
set hive.optimize.cte.materialize.threshold=2; -- with片段hive计算时物化进内存不用重复计算

-- 开发代码区域

