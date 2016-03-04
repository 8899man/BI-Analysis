/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/9/24 星期四 下午 16:22:56                    */
/*==============================================================*/


drop table if exists b_proj_sum;

drop table if exists customer_attach_count;

drop table if exists customer_bought_count;

drop table if exists customer_count_main;

drop table if exists customer_intention_count;

drop table if exists format_convert;

drop table if exists index_base;

drop table if exists index_flow;

/*==============================================================*/
/* Table: b_proj_sum                                            */
/*==============================================================*/
create table b_proj_sum
(
   proj_sum_id          bigint not null auto_increment comment '序列号',
   proj_guid            varchar(64) not null comment '项目GUID',
   proj_name            varchar(120) comment '项目名称',
   area_id              int comment '区域id',
   cityCode             int not null comment '城市ID',
   sale_sum             int comment '总成交套数',
   saleamountsum        double comment '总成交金额',
   sale_scale           double comment '已销比例',
   trade_sum            int comment '总投诉单数',
   repairs_sum          int comment '总报修单数',
   family_sum           int comment '总户数',
   create_time          timestamp comment '统计时间',
   primary key (proj_sum_id)
);

alter table b_proj_sum comment '项目汇总表';

/*==============================================================*/
/* Table: customer_attach_count                                 */
/*==============================================================*/
create table customer_attach_count
(
   customer_attach_id   bigint not null auto_increment comment '序列号',
   proj_id              varchar(64) comment '项目编号',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   customer_type        int comment '客户类型
            1=已购客户
            2=意向客户',
   customer_age_type    int comment '客户年龄段
            1=20岁以下
            2=20-34岁
            3=35-44岁
            4=44-55岁
            5=56-64岁
            6=65岁以上',
   customer_age_sum     int comment '客户年龄段人数',
   count_time           timestamp comment '统计时间',
   primary key (customer_attach_id)
);

alter table customer_attach_count comment '客户特征统计表';

/*==============================================================*/
/* Table: customer_bought_count                                 */
/*==============================================================*/
create table customer_bought_count
(
   customer_bought_id   bigint not null auto_increment comment '序列号',
   proj_id              varchar(64) comment '项目编号',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   customer_type        int comment '客户类型
            1=已购客户
            2=意向客户',
   customer_invest_sum  int comment '总投资客户数',
   customer_self_sum    int comment '总自住客户数',
   customer_forward_sum int comment '总期房客户数',
   customer_change_sum  int comment '总更改业主客户数',
   customer_follow_sum  int comment '总跟进客户数',
   customer_expect_sum  int comment '总已预期客户数',
   customer_away_sum    int comment '总已流失客户数',
   create_time          timestamp comment '统计时间',
   primary key (customer_bought_id)
);

alter table customer_bought_count comment '已购客户分类统计表';

/*==============================================================*/
/* Table: customer_count_main                                   */
/*==============================================================*/
create table customer_count_main
(
   customer_count_id    bigint not null auto_increment comment '序列号',
   proj_id              varchar(24) comment '项目编号',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   customer_type        int comment '客户类型
            1=已购客户
            2=意向客户',
   customer_bought_sum  int comment '已购客户数',
   customer_intention_sum int comment '意向客户数',
   create_time          timestamp comment '统计时间',
   primary key (customer_count_id)
);

alter table customer_count_main comment '客户分类统计主表';

/*==============================================================*/
/* Table: customer_intention_count                              */
/*==============================================================*/
create table customer_intention_count
(
   customer_intention_id bigint not null auto_increment comment '序列号',
   proj_id              varchar(64) comment '项目编号',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   customer_type        int comment '客户类型',
   customer_follow_sum  int comment '总跟进客户数',
   customer_expect_sum  int comment '总已预期客户数',
   customer_away_sum    int comment '总已流失客户数',
   create_time          timestamp comment '统计时间',
   primary key (customer_intention_id)
);

alter table customer_intention_count comment '意向客户分类统计表';

/*==============================================================*/
/* Table: format_convert                                        */
/*==============================================================*/
create table format_convert
(
   format_convert_id    bigint not null auto_increment comment '序列号',
   proj_guid            varchar(64) comment '项目编码',
   index_format_type    double comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   incoming_visit_sum   double comment '来电转到访数',
   visit_confess_sum    double comment '到访转认筹数',
   visti_subscribe_sum  double comment '到访转认购数',
   confess_subscribe_sum double comment '认筹转认购数',
   subscribe_contract_sum double comment '认购转签约数',
   contract_returned_sum double comment '签约转回款数',
   create_time          timestamp comment '统计时间',
   primary key (format_convert_id)
);

alter table format_convert comment '转化率分析表
';

/*==============================================================*/
/* Table: index_base                                            */
/*==============================================================*/
create table index_base
(
   index_base_id        bigint not null auto_increment comment '序列号',
   proj_guid            varchar(64) comment '项目GUID',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业
            ',
   follow_customer_sum  int comment '跟进客户数',
   new_visitors_sum     int comment '新客到访数',
   old_visitors_sum     int comment '老客到访数',
   confess_customer_sum int comment '认筹客户数',
   confess_cycle_sum    int comment '认筹套数',
   confess_amount_sum   double comment '认筹金额',
   subscribe_customer_sum int comment '认购客户数',
   subscribe_cycle_sum  int comment '认购套数',
   subscribe_amount_sum double comment '认购金额',
   contract_customer_sum int comment '签约客户数',
   contract_cycle_sum   int comment '签约套数',
   contract_amount_sum  double comment '签约金额',
   returned_customer_sum int comment '回款客户数',
   returned_cycle_sum   int comment '回款套数',
   returned_amount_sum  double comment '回款金额',
   create_time          timestamp comment '统计时间',
   primary key (index_base_id)
);

alter table index_base comment '关键指标汇总表';

/*==============================================================*/
/* Table: index_flow                                            */
/*==============================================================*/
create table index_flow
(
   index_flow_id        bigint not null auto_increment comment '序列号',
   proj_guid            varchar(64) comment '项目编号',
   index_format_type    int comment '业态类型
            1=销售
            2=服务
            3=物业
            4=置业',
   visit_days           int comment '到访天数',
   average_baseline_days int comment '平均基线天数',
   overstep_days        int comment '超出天数',
   confess_days         int comment '认购天数',
   createtime           timestamp comment '统计汇总时间',
   primary key (index_flow_id)
);

alter table index_flow comment '关键流程分析表';

