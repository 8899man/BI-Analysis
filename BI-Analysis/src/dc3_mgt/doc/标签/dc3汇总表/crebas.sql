/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/9/24 ������ ���� 16:22:56                    */
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
   proj_sum_id          bigint not null auto_increment comment '���к�',
   proj_guid            varchar(64) not null comment '��ĿGUID',
   proj_name            varchar(120) comment '��Ŀ����',
   area_id              int comment '����id',
   cityCode             int not null comment '����ID',
   sale_sum             int comment '�ܳɽ�����',
   saleamountsum        double comment '�ܳɽ����',
   sale_scale           double comment '��������',
   trade_sum            int comment '��Ͷ�ߵ���',
   repairs_sum          int comment '�ܱ��޵���',
   family_sum           int comment '�ܻ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (proj_sum_id)
);

alter table b_proj_sum comment '��Ŀ���ܱ�';

/*==============================================================*/
/* Table: customer_attach_count                                 */
/*==============================================================*/
create table customer_attach_count
(
   customer_attach_id   bigint not null auto_increment comment '���к�',
   proj_id              varchar(64) comment '��Ŀ���',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   customer_type        int comment '�ͻ�����
            1=�ѹ��ͻ�
            2=����ͻ�',
   customer_age_type    int comment '�ͻ������
            1=20������
            2=20-34��
            3=35-44��
            4=44-55��
            5=56-64��
            6=65������',
   customer_age_sum     int comment '�ͻ����������',
   count_time           timestamp comment 'ͳ��ʱ��',
   primary key (customer_attach_id)
);

alter table customer_attach_count comment '�ͻ�����ͳ�Ʊ�';

/*==============================================================*/
/* Table: customer_bought_count                                 */
/*==============================================================*/
create table customer_bought_count
(
   customer_bought_id   bigint not null auto_increment comment '���к�',
   proj_id              varchar(64) comment '��Ŀ���',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   customer_type        int comment '�ͻ�����
            1=�ѹ��ͻ�
            2=����ͻ�',
   customer_invest_sum  int comment '��Ͷ�ʿͻ���',
   customer_self_sum    int comment '����ס�ͻ���',
   customer_forward_sum int comment '���ڷ��ͻ���',
   customer_change_sum  int comment '�ܸ���ҵ���ͻ���',
   customer_follow_sum  int comment '�ܸ����ͻ���',
   customer_expect_sum  int comment '����Ԥ�ڿͻ���',
   customer_away_sum    int comment '������ʧ�ͻ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (customer_bought_id)
);

alter table customer_bought_count comment '�ѹ��ͻ�����ͳ�Ʊ�';

/*==============================================================*/
/* Table: customer_count_main                                   */
/*==============================================================*/
create table customer_count_main
(
   customer_count_id    bigint not null auto_increment comment '���к�',
   proj_id              varchar(24) comment '��Ŀ���',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   customer_type        int comment '�ͻ�����
            1=�ѹ��ͻ�
            2=����ͻ�',
   customer_bought_sum  int comment '�ѹ��ͻ���',
   customer_intention_sum int comment '����ͻ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (customer_count_id)
);

alter table customer_count_main comment '�ͻ�����ͳ������';

/*==============================================================*/
/* Table: customer_intention_count                              */
/*==============================================================*/
create table customer_intention_count
(
   customer_intention_id bigint not null auto_increment comment '���к�',
   proj_id              varchar(64) comment '��Ŀ���',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   customer_type        int comment '�ͻ�����',
   customer_follow_sum  int comment '�ܸ����ͻ���',
   customer_expect_sum  int comment '����Ԥ�ڿͻ���',
   customer_away_sum    int comment '������ʧ�ͻ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (customer_intention_id)
);

alter table customer_intention_count comment '����ͻ�����ͳ�Ʊ�';

/*==============================================================*/
/* Table: format_convert                                        */
/*==============================================================*/
create table format_convert
(
   format_convert_id    bigint not null auto_increment comment '���к�',
   proj_guid            varchar(64) comment '��Ŀ����',
   index_format_type    double comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   incoming_visit_sum   double comment '����ת������',
   visit_confess_sum    double comment '����ת�ϳ���',
   visti_subscribe_sum  double comment '����ת�Ϲ���',
   confess_subscribe_sum double comment '�ϳ�ת�Ϲ���',
   subscribe_contract_sum double comment '�Ϲ�תǩԼ��',
   contract_returned_sum double comment 'ǩԼת�ؿ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (format_convert_id)
);

alter table format_convert comment 'ת���ʷ�����
';

/*==============================================================*/
/* Table: index_base                                            */
/*==============================================================*/
create table index_base
(
   index_base_id        bigint not null auto_increment comment '���к�',
   proj_guid            varchar(64) comment '��ĿGUID',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ
            ',
   follow_customer_sum  int comment '�����ͻ���',
   new_visitors_sum     int comment '�¿͵�����',
   old_visitors_sum     int comment '�Ͽ͵�����',
   confess_customer_sum int comment '�ϳ�ͻ���',
   confess_cycle_sum    int comment '�ϳ�����',
   confess_amount_sum   double comment '�ϳ���',
   subscribe_customer_sum int comment '�Ϲ��ͻ���',
   subscribe_cycle_sum  int comment '�Ϲ�����',
   subscribe_amount_sum double comment '�Ϲ����',
   contract_customer_sum int comment 'ǩԼ�ͻ���',
   contract_cycle_sum   int comment 'ǩԼ����',
   contract_amount_sum  double comment 'ǩԼ���',
   returned_customer_sum int comment '�ؿ�ͻ���',
   returned_cycle_sum   int comment '�ؿ�����',
   returned_amount_sum  double comment '�ؿ���',
   create_time          timestamp comment 'ͳ��ʱ��',
   primary key (index_base_id)
);

alter table index_base comment '�ؼ�ָ����ܱ�';

/*==============================================================*/
/* Table: index_flow                                            */
/*==============================================================*/
create table index_flow
(
   index_flow_id        bigint not null auto_increment comment '���к�',
   proj_guid            varchar(64) comment '��Ŀ���',
   index_format_type    int comment 'ҵ̬����
            1=����
            2=����
            3=��ҵ
            4=��ҵ',
   visit_days           int comment '��������',
   average_baseline_days int comment 'ƽ����������',
   overstep_days        int comment '��������',
   confess_days         int comment '�Ϲ�����',
   createtime           timestamp comment 'ͳ�ƻ���ʱ��',
   primary key (index_flow_id)
);

alter table index_flow comment '�ؼ����̷�����';

