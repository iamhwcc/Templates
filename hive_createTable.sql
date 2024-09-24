create table xxxx.xxxxx
(
	business_line   string comment '业务线',
	school_code     bigint comment '分校编码',
	columns			double comment '备注'
) 
comment '爱分析招生大屏教师人数表'
partitioned by (dt string comment '天分区', hour string comment '小时分区')