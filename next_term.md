### To find current term and next term「Template」

``` sql
select 
    school.school_code          as school_code                                      
    ,school.school_name         as school_name
    ,cur_term.year              as cur_term_year
    ,cur_term.term_id           as cur_term_id
    ,cur_term.term_name         as cur_term_name
    ,cast((cast(next_term.year as int) + cast(next_term.next_term_cross_year as int)) as string) as next_term_year
    ,next_term.next_term_id     as next_term_id
    ,next_term.next_term_name   as next_term_name
from 
( 
    select 
        school_code 
        ,school_name
    from 
        hw_dimdb.dim_school 
    where 
        is_valid = 1 
) school 
join
(
    select
        school_code
        ,case 
            when (school_code='6501' and is_competition=0 and substr(`date`,6,10) between '01-01' and '01-02') then cast(year as int)-1      -- 2023-12-05 yanpeng2 修复错误
            when (school_code='6001' and is_competition=0 and substr(`date`,6,10) between '01-01' and '03-14') then cast(year as int)-1      -- 2023-03-01 yanpeng2 解决马来西亚分校跨产品年问题
            when (school_code='4401' and is_competition=0 and substr(`date`,6,10) between '01-01' and '01-09') then cast(year as int)-1      -- 2023-12-05 yanpeng2 解决英国分校学期跨年问题
            else year
        end as year
        ,term_id
        ,term_name
    from 
        hw_dimdb.dim_school_calendar_fh
    where 
        dt='${yes_date}'
    and 
        hour='23'
    and 
        date = '${yes_date}'
) cur_term
on 
    school.school_code = cur_term.school_code
left join
(
    select
        year
        ,school_code
        ,term_id
        ,next_term_id
        ,next_term_name
        ,next_term_cross_year
    from 
        hw_dimdb.dim_term_year
) next_term
on
    next_term.term_id = cur_term.term_id
and
    next_term.year = cur_term.year 
and
    next_term.school_code = cur_term.school_code
```
