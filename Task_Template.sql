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
set hive.support.concurrency=false;             --关闭锁机制
set hive.exec.parallel=true;                    --开启同一个sql中任务并行
set hive.exec.parallel.thread.number=32;        --指定同一个sql允许并行运行的最大线程数。
set hive.auto.convert.join=true;                --自动化 MapJoin


-- 开发代码区域

