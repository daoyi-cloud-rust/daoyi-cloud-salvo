-- 提取的 system_ 开头表相关SQL

DROP TABLE IF EXISTS system_dept;
CREATE TABLE system_dept
(
    id             BIGSERIAL PRIMARY KEY,
    name           varchar(30) NOT NULL DEFAULT '',
    parent_id      int8        NOT NULL DEFAULT 0,
    sort           int4        NOT NULL DEFAULT 0,
    leader_user_id int8 NULL     DEFAULT NULL,
    phone          varchar(11) NULL     DEFAULT NULL,
    email          varchar(50) NULL     DEFAULT NULL,
    status         int2        NOT NULL,
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2        NOT NULL DEFAULT 0,
    tenant_id      int8        NOT NULL DEFAULT 0
);


COMMENT
ON COLUMN system_dept.id IS '部门id';
COMMENT
ON COLUMN system_dept.name IS '部门名称';
COMMENT
ON COLUMN system_dept.parent_id IS '父部门id';
COMMENT
ON COLUMN system_dept.sort IS '显示顺序';
COMMENT
ON COLUMN system_dept.leader_user_id IS '负责人';
COMMENT
ON COLUMN system_dept.phone IS '联系电话';
COMMENT
ON COLUMN system_dept.email IS '邮箱';
COMMENT
ON COLUMN system_dept.status IS '部门状态（0正常 1停用）';
COMMENT
ON COLUMN system_dept.creator IS '创建者';
COMMENT
ON COLUMN system_dept.create_time IS '创建时间';
COMMENT
ON COLUMN system_dept.updater IS '更新者';
COMMENT
ON COLUMN system_dept.update_time IS '更新时间';
COMMENT
ON COLUMN system_dept.deleted IS '是否删除';
COMMENT
ON COLUMN system_dept.tenant_id IS '租户编号';
COMMENT
ON TABLE system_dept IS '部门表';



DROP TABLE IF EXISTS system_dict_data;
CREATE TABLE system_dict_data
(
    id          BIGSERIAL PRIMARY KEY,
    sort        int4         NOT NULL DEFAULT 0,
    label       varchar(100) NOT NULL DEFAULT '',
    value       varchar(100) NOT NULL DEFAULT '',
    dict_type   varchar(100) NOT NULL DEFAULT '',
    status      int2         NOT NULL DEFAULT 0,
    color_type  varchar(100) NULL     DEFAULT '',
    css_class   varchar(100) NULL     DEFAULT '',
    remark      varchar(500) NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_dict_data.id IS '字典编码';
COMMENT
ON COLUMN system_dict_data.sort IS '字典排序';
COMMENT
ON COLUMN system_dict_data.label IS '字典标签';
COMMENT
ON COLUMN system_dict_data.value IS '字典键值';
COMMENT
ON COLUMN system_dict_data.dict_type IS '字典类型';
COMMENT
ON COLUMN system_dict_data.status IS '状态（0正常 1停用）';
COMMENT
ON COLUMN system_dict_data.color_type IS '颜色类型';
COMMENT
ON COLUMN system_dict_data.css_class IS 'css 样式';
COMMENT
ON COLUMN system_dict_data.remark IS '备注';
COMMENT
ON COLUMN system_dict_data.creator IS '创建者';
COMMENT
ON COLUMN system_dict_data.create_time IS '创建时间';
COMMENT
ON COLUMN system_dict_data.updater IS '更新者';
COMMENT
ON COLUMN system_dict_data.update_time IS '更新时间';
COMMENT
ON COLUMN system_dict_data.deleted IS '是否删除';
COMMENT
ON TABLE system_dict_data IS '字典数据表';



DROP TABLE IF EXISTS system_dict_type;
CREATE TABLE system_dict_type
(
    id           BIGSERIAL PRIMARY KEY,
    name         varchar(100) NOT NULL DEFAULT '',
    type         varchar(100) NOT NULL DEFAULT '',
    status       int2         NOT NULL DEFAULT 0,
    remark       varchar(500) NULL     DEFAULT NULL,
    creator      varchar(64) NULL     DEFAULT '',
    create_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater      varchar(64) NULL     DEFAULT '',
    update_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted      int2         NOT NULL DEFAULT 0,
    deleted_time timestamp NULL     DEFAULT NULL
);

COMMENT
ON COLUMN system_dict_type.id IS '字典主键';
COMMENT
ON COLUMN system_dict_type.name IS '字典名称';
COMMENT
ON COLUMN system_dict_type.type IS '字典类型';
COMMENT
ON COLUMN system_dict_type.status IS '状态（0正常 1停用）';
COMMENT
ON COLUMN system_dict_type.remark IS '备注';
COMMENT
ON COLUMN system_dict_type.creator IS '创建者';
COMMENT
ON COLUMN system_dict_type.create_time IS '创建时间';
COMMENT
ON COLUMN system_dict_type.updater IS '更新者';
COMMENT
ON COLUMN system_dict_type.update_time IS '更新时间';
COMMENT
ON COLUMN system_dict_type.deleted IS '是否删除';
COMMENT
ON COLUMN system_dict_type.deleted_time IS '删除时间';
COMMENT
ON TABLE system_dict_type IS '字典类型表';



DROP TABLE IF EXISTS system_login_log;
CREATE TABLE system_login_log
(
    id          BIGSERIAL PRIMARY KEY,
    log_type    int8         NOT NULL,
    trace_id    varchar(64)  NOT NULL DEFAULT '',
    user_id     int8         NOT NULL DEFAULT 0,
    user_type   int2         NOT NULL DEFAULT 0,
    username    varchar(50)  NOT NULL DEFAULT '',
    result      int2         NOT NULL,
    user_ip     varchar(50)  NOT NULL,
    user_agent  varchar(512) NOT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0,
    tenant_id   int8         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_login_log.id IS '访问ID';
COMMENT
ON COLUMN system_login_log.log_type IS '日志类型';
COMMENT
ON COLUMN system_login_log.trace_id IS '链路追踪编号';
COMMENT
ON COLUMN system_login_log.user_id IS '用户编号';
COMMENT
ON COLUMN system_login_log.user_type IS '用户类型';
COMMENT
ON COLUMN system_login_log.username IS '用户账号';
COMMENT
ON COLUMN system_login_log.result IS '登陆结果';
COMMENT
ON COLUMN system_login_log.user_ip IS '用户 IP';
COMMENT
ON COLUMN system_login_log.user_agent IS '浏览器 UA';
COMMENT
ON COLUMN system_login_log.creator IS '创建者';
COMMENT
ON COLUMN system_login_log.create_time IS '创建时间';
COMMENT
ON COLUMN system_login_log.updater IS '更新者';
COMMENT
ON COLUMN system_login_log.update_time IS '更新时间';
COMMENT
ON COLUMN system_login_log.deleted IS '是否删除';
COMMENT
ON COLUMN system_login_log.tenant_id IS '租户编号';
COMMENT
ON TABLE system_login_log IS '系统访问记录';



DROP TABLE IF EXISTS system_mail_account;
CREATE TABLE system_mail_account
(
    id              BIGSERIAL PRIMARY KEY,
    mail            varchar(255) NOT NULL,
    username        varchar(255) NOT NULL,
    password        varchar(255) NOT NULL,
    host            varchar(255) NOT NULL,
    port            int4         NOT NULL,
    ssl_enable      bool         NOT NULL DEFAULT '0',
    starttls_enable bool         NOT NULL DEFAULT '0',
    creator         varchar(64) NULL     DEFAULT '',
    create_time     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater         varchar(64) NULL     DEFAULT '',
    update_time     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted         int2         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_mail_account.id IS '主键';
COMMENT
ON COLUMN system_mail_account.mail IS '邮箱';
COMMENT
ON COLUMN system_mail_account.username IS '用户名';
COMMENT
ON COLUMN system_mail_account.password IS '密码';
COMMENT
ON COLUMN system_mail_account.host IS 'SMTP 服务器域名';
COMMENT
ON COLUMN system_mail_account.port IS 'SMTP 服务器端口';
COMMENT
ON COLUMN system_mail_account.ssl_enable IS '是否开启 SSL';
COMMENT
ON COLUMN system_mail_account.starttls_enable IS '是否开启 STARTTLS';
COMMENT
ON COLUMN system_mail_account.creator IS '创建者';
COMMENT
ON COLUMN system_mail_account.create_time IS '创建时间';
COMMENT
ON COLUMN system_mail_account.updater IS '更新者';
COMMENT
ON COLUMN system_mail_account.update_time IS '更新时间';
COMMENT
ON COLUMN system_mail_account.deleted IS '是否删除';
COMMENT
ON TABLE system_mail_account IS '邮箱账号表';



DROP TABLE IF EXISTS system_mail_log;
CREATE TABLE system_mail_log
(
    id                BIGSERIAL PRIMARY KEY,
    user_id           int8 NULL     DEFAULT NULL,
    user_type         int2 NULL     DEFAULT NULL,
    to_mail           varchar(255)   NOT NULL,
    account_id        int8           NOT NULL,
    from_mail         varchar(255)   NOT NULL,
    template_id       int8           NOT NULL,
    template_code     varchar(63)    NOT NULL,
    template_nickname varchar(255) NULL     DEFAULT NULL,
    template_title    varchar(255)   NOT NULL,
    template_content  varchar(10240) NOT NULL,
    template_params   varchar(255)   NOT NULL,
    send_status       int2           NOT NULL DEFAULT 0,
    send_time         timestamp NULL     DEFAULT NULL,
    send_message_id   varchar(255) NULL     DEFAULT NULL,
    send_exception    varchar(4096) NULL     DEFAULT NULL,
    creator           varchar(64) NULL     DEFAULT '',
    create_time       timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater           varchar(64) NULL     DEFAULT '',
    update_time       timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted           int2           NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_mail_log.id IS '编号';
COMMENT
ON COLUMN system_mail_log.user_id IS '用户编号';
COMMENT
ON COLUMN system_mail_log.user_type IS '用户类型';
COMMENT
ON COLUMN system_mail_log.to_mail IS '接收邮箱地址';
COMMENT
ON COLUMN system_mail_log.account_id IS '邮箱账号编号';
COMMENT
ON COLUMN system_mail_log.from_mail IS '发送邮箱地址';
COMMENT
ON COLUMN system_mail_log.template_id IS '模板编号';
COMMENT
ON COLUMN system_mail_log.template_code IS '模板编码';
COMMENT
ON COLUMN system_mail_log.template_nickname IS '模版发送人名称';
COMMENT
ON COLUMN system_mail_log.template_title IS '邮件标题';
COMMENT
ON COLUMN system_mail_log.template_content IS '邮件内容';
COMMENT
ON COLUMN system_mail_log.template_params IS '邮件参数';
COMMENT
ON COLUMN system_mail_log.send_status IS '发送状态';
COMMENT
ON COLUMN system_mail_log.send_time IS '发送时间';
COMMENT
ON COLUMN system_mail_log.send_message_id IS '发送返回的消息 ID';
COMMENT
ON COLUMN system_mail_log.send_exception IS '发送异常';
COMMENT
ON COLUMN system_mail_log.creator IS '创建者';
COMMENT
ON COLUMN system_mail_log.create_time IS '创建时间';
COMMENT
ON COLUMN system_mail_log.updater IS '更新者';
COMMENT
ON COLUMN system_mail_log.update_time IS '更新时间';
COMMENT
ON COLUMN system_mail_log.deleted IS '是否删除';
COMMENT
ON TABLE system_mail_log IS '邮件日志表';



DROP TABLE IF EXISTS system_mail_template;
CREATE TABLE system_mail_template
(
    id          BIGSERIAL PRIMARY KEY,
    name        varchar(63)    NOT NULL,
    code        varchar(63)    NOT NULL,
    account_id  int8           NOT NULL,
    nickname    varchar(255) NULL     DEFAULT NULL,
    title       varchar(255)   NOT NULL,
    content     varchar(10240) NOT NULL,
    params      varchar(255)   NOT NULL,
    status      int2           NOT NULL,
    remark      varchar(255) NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2           NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_mail_template.id IS '编号';
COMMENT
ON COLUMN system_mail_template.name IS '模板名称';
COMMENT
ON COLUMN system_mail_template.code IS '模板编码';
COMMENT
ON COLUMN system_mail_template.account_id IS '发送的邮箱账号编号';
COMMENT
ON COLUMN system_mail_template.nickname IS '发送人名称';
COMMENT
ON COLUMN system_mail_template.title IS '模板标题';
COMMENT
ON COLUMN system_mail_template.content IS '模板内容';
COMMENT
ON COLUMN system_mail_template.params IS '参数数组';
COMMENT
ON COLUMN system_mail_template.status IS '开启状态';
COMMENT
ON COLUMN system_mail_template.remark IS '备注';
COMMENT
ON COLUMN system_mail_template.creator IS '创建者';
COMMENT
ON COLUMN system_mail_template.create_time IS '创建时间';
COMMENT
ON COLUMN system_mail_template.updater IS '更新者';
COMMENT
ON COLUMN system_mail_template.update_time IS '更新时间';
COMMENT
ON COLUMN system_mail_template.deleted IS '是否删除';
COMMENT
ON TABLE system_mail_template IS '邮件模版表';



DROP TABLE IF EXISTS system_menu;
CREATE TABLE system_menu
(
    id             BIGSERIAL PRIMARY KEY,
    name           varchar(50)  NOT NULL,
    permission     varchar(100) NOT NULL DEFAULT '',
    type           int2         NOT NULL,
    sort           int4         NOT NULL DEFAULT 0,
    parent_id      int8         NOT NULL DEFAULT 0,
    path           varchar(200) NULL     DEFAULT '',
    icon           varchar(100) NULL     DEFAULT '#',
    component      varchar(255) NULL     DEFAULT NULL,
    component_name varchar(255) NULL     DEFAULT NULL,
    status         int2         NOT NULL DEFAULT 0,
    visible        bool         NOT NULL DEFAULT '1',
    keep_alive     bool         NOT NULL DEFAULT '1',
    always_show    bool         NOT NULL DEFAULT '1',
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_menu.id IS '菜单ID';
COMMENT
ON COLUMN system_menu.name IS '菜单名称';
COMMENT
ON COLUMN system_menu.permission IS '权限标识';
COMMENT
ON COLUMN system_menu.type IS '菜单类型';
COMMENT
ON COLUMN system_menu.sort IS '显示顺序';
COMMENT
ON COLUMN system_menu.parent_id IS '父菜单ID';
COMMENT
ON COLUMN system_menu.path IS '路由地址';
COMMENT
ON COLUMN system_menu.icon IS '菜单图标';
COMMENT
ON COLUMN system_menu.component IS '组件路径';
COMMENT
ON COLUMN system_menu.component_name IS '组件名';
COMMENT
ON COLUMN system_menu.status IS '菜单状态';
COMMENT
ON COLUMN system_menu.visible IS '是否可见';
COMMENT
ON COLUMN system_menu.keep_alive IS '是否缓存';
COMMENT
ON COLUMN system_menu.always_show IS '是否总是显示';
COMMENT
ON COLUMN system_menu.creator IS '创建者';
COMMENT
ON COLUMN system_menu.create_time IS '创建时间';
COMMENT
ON COLUMN system_menu.updater IS '更新者';
COMMENT
ON COLUMN system_menu.update_time IS '更新时间';
COMMENT
ON COLUMN system_menu.deleted IS '是否删除';
COMMENT
ON TABLE system_menu IS '菜单权限表';



DROP TABLE IF EXISTS system_notice;
CREATE TABLE system_notice
(
    id          BIGSERIAL PRIMARY KEY,
    title       varchar(50) NOT NULL,
    content     text        NOT NULL,
    type        int2        NOT NULL,
    status      int2        NOT NULL DEFAULT 0,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2        NOT NULL DEFAULT 0,
    tenant_id   int8        NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_notice.id IS '公告ID';
COMMENT
ON COLUMN system_notice.title IS '公告标题';
COMMENT
ON COLUMN system_notice.content IS '公告内容';
COMMENT
ON COLUMN system_notice.type IS '公告类型（1通知 2公告）';
COMMENT
ON COLUMN system_notice.status IS '公告状态（0正常 1关闭）';
COMMENT
ON COLUMN system_notice.creator IS '创建者';
COMMENT
ON COLUMN system_notice.create_time IS '创建时间';
COMMENT
ON COLUMN system_notice.updater IS '更新者';
COMMENT
ON COLUMN system_notice.update_time IS '更新时间';
COMMENT
ON COLUMN system_notice.deleted IS '是否删除';
COMMENT
ON COLUMN system_notice.tenant_id IS '租户编号';
COMMENT
ON TABLE system_notice IS '通知公告表';



DROP TABLE IF EXISTS system_notify_message;
CREATE TABLE system_notify_message
(
    id                BIGSERIAL PRIMARY KEY,
    user_id           int8          NOT NULL,
    user_type         int2          NOT NULL,
    template_id       int8          NOT NULL,
    template_code     varchar(64)   NOT NULL,
    template_nickname varchar(63)   NOT NULL,
    template_content  varchar(1024) NOT NULL,
    template_type     int4          NOT NULL,
    template_params   varchar(255)  NOT NULL,
    read_status       bool          NOT NULL,
    read_time         timestamp NULL     DEFAULT NULL,
    creator           varchar(64) NULL     DEFAULT '',
    create_time       timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater           varchar(64) NULL     DEFAULT '',
    update_time       timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted           int2          NOT NULL DEFAULT 0,
    tenant_id         int8          NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_notify_message.id IS '用户ID';
COMMENT
ON COLUMN system_notify_message.user_id IS '用户id';
COMMENT
ON COLUMN system_notify_message.user_type IS '用户类型';
COMMENT
ON COLUMN system_notify_message.template_id IS '模版编号';
COMMENT
ON COLUMN system_notify_message.template_code IS '模板编码';
COMMENT
ON COLUMN system_notify_message.template_nickname IS '模版发送人名称';
COMMENT
ON COLUMN system_notify_message.template_content IS '模版内容';
COMMENT
ON COLUMN system_notify_message.template_type IS '模版类型';
COMMENT
ON COLUMN system_notify_message.template_params IS '模版参数';
COMMENT
ON COLUMN system_notify_message.read_status IS '是否已读';
COMMENT
ON COLUMN system_notify_message.read_time IS '阅读时间';
COMMENT
ON COLUMN system_notify_message.creator IS '创建者';
COMMENT
ON COLUMN system_notify_message.create_time IS '创建时间';
COMMENT
ON COLUMN system_notify_message.updater IS '更新者';
COMMENT
ON COLUMN system_notify_message.update_time IS '更新时间';
COMMENT
ON COLUMN system_notify_message.deleted IS '是否删除';
COMMENT
ON COLUMN system_notify_message.tenant_id IS '租户编号';
COMMENT
ON TABLE system_notify_message IS '站内信消息表';



DROP TABLE IF EXISTS system_notify_template;
CREATE TABLE system_notify_template
(
    id          BIGSERIAL PRIMARY KEY,
    name        varchar(63)   NOT NULL,
    code        varchar(64)   NOT NULL,
    nickname    varchar(255)  NOT NULL,
    content     varchar(1024) NOT NULL,
    type        int2          NOT NULL,
    params      varchar(255) NULL     DEFAULT NULL,
    status      int2          NOT NULL,
    remark      varchar(255) NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2          NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_notify_template.id IS '主键';
COMMENT
ON COLUMN system_notify_template.name IS '模板名称';
COMMENT
ON COLUMN system_notify_template.code IS '模版编码';
COMMENT
ON COLUMN system_notify_template.nickname IS '发送人名称';
COMMENT
ON COLUMN system_notify_template.content IS '模版内容';
COMMENT
ON COLUMN system_notify_template.type IS '类型';
COMMENT
ON COLUMN system_notify_template.params IS '参数数组';
COMMENT
ON COLUMN system_notify_template.status IS '状态';
COMMENT
ON COLUMN system_notify_template.remark IS '备注';
COMMENT
ON COLUMN system_notify_template.creator IS '创建者';
COMMENT
ON COLUMN system_notify_template.create_time IS '创建时间';
COMMENT
ON COLUMN system_notify_template.updater IS '更新者';
COMMENT
ON COLUMN system_notify_template.update_time IS '更新时间';
COMMENT
ON COLUMN system_notify_template.deleted IS '是否删除';
COMMENT
ON TABLE system_notify_template IS '站内信模板表';



DROP TABLE IF EXISTS system_oauth2_access_token;
CREATE TABLE system_oauth2_access_token
(
    id            BIGSERIAL PRIMARY KEY,
    user_id       int8         NOT NULL,
    user_type     int2         NOT NULL,
    user_info     varchar(512) NOT NULL,
    access_token  varchar(255) NOT NULL,
    refresh_token varchar(32)  NOT NULL,
    client_id     varchar(255) NOT NULL,
    scopes        varchar(255) NULL     DEFAULT NULL,
    expires_time  timestamp    NOT NULL,
    creator       varchar(64) NULL     DEFAULT '',
    create_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater       varchar(64) NULL     DEFAULT '',
    update_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted       int2         NOT NULL DEFAULT 0,
    tenant_id     int8         NOT NULL DEFAULT 0
);

CREATE INDEX idx_system_oauth2_access_token_01 ON system_oauth2_access_token (access_token);
CREATE INDEX idx_system_oauth2_access_token_02 ON system_oauth2_access_token (refresh_token);

COMMENT
ON COLUMN system_oauth2_access_token.id IS '编号';
COMMENT
ON COLUMN system_oauth2_access_token.user_id IS '用户编号';
COMMENT
ON COLUMN system_oauth2_access_token.user_type IS '用户类型';
COMMENT
ON COLUMN system_oauth2_access_token.user_info IS '用户信息';
COMMENT
ON COLUMN system_oauth2_access_token.access_token IS '访问令牌';
COMMENT
ON COLUMN system_oauth2_access_token.refresh_token IS '刷新令牌';
COMMENT
ON COLUMN system_oauth2_access_token.client_id IS '客户端编号';
COMMENT
ON COLUMN system_oauth2_access_token.scopes IS '授权范围';
COMMENT
ON COLUMN system_oauth2_access_token.expires_time IS '过期时间';
COMMENT
ON COLUMN system_oauth2_access_token.creator IS '创建者';
COMMENT
ON COLUMN system_oauth2_access_token.create_time IS '创建时间';
COMMENT
ON COLUMN system_oauth2_access_token.updater IS '更新者';
COMMENT
ON COLUMN system_oauth2_access_token.update_time IS '更新时间';
COMMENT
ON COLUMN system_oauth2_access_token.deleted IS '是否删除';
COMMENT
ON COLUMN system_oauth2_access_token.tenant_id IS '租户编号';
COMMENT
ON TABLE system_oauth2_access_token IS 'OAuth2 访问令牌';



DROP TABLE IF EXISTS system_oauth2_approve;
CREATE TABLE system_oauth2_approve
(
    id           BIGSERIAL PRIMARY KEY,
    user_id      int8         NOT NULL,
    user_type    int2         NOT NULL,
    client_id    varchar(255) NOT NULL,
    scope        varchar(255) NOT NULL DEFAULT '',
    approved     bool         NOT NULL DEFAULT '0',
    expires_time timestamp    NOT NULL,
    creator      varchar(64) NULL     DEFAULT '',
    create_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater      varchar(64) NULL     DEFAULT '',
    update_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted      int2         NOT NULL DEFAULT 0,
    tenant_id    int8         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_oauth2_approve.id IS '编号';
COMMENT
ON COLUMN system_oauth2_approve.user_id IS '用户编号';
COMMENT
ON COLUMN system_oauth2_approve.user_type IS '用户类型';
COMMENT
ON COLUMN system_oauth2_approve.client_id IS '客户端编号';
COMMENT
ON COLUMN system_oauth2_approve.scope IS '授权范围';
COMMENT
ON COLUMN system_oauth2_approve.approved IS '是否接受';
COMMENT
ON COLUMN system_oauth2_approve.expires_time IS '过期时间';
COMMENT
ON COLUMN system_oauth2_approve.creator IS '创建者';
COMMENT
ON COLUMN system_oauth2_approve.create_time IS '创建时间';
COMMENT
ON COLUMN system_oauth2_approve.updater IS '更新者';
COMMENT
ON COLUMN system_oauth2_approve.update_time IS '更新时间';
COMMENT
ON COLUMN system_oauth2_approve.deleted IS '是否删除';
COMMENT
ON COLUMN system_oauth2_approve.tenant_id IS '租户编号';
COMMENT
ON TABLE system_oauth2_approve IS 'OAuth2 批准表';



DROP TABLE IF EXISTS system_oauth2_client;
CREATE TABLE system_oauth2_client
(
    id                             BIGSERIAL PRIMARY KEY,
    client_id                      varchar(255) NOT NULL,
    secret                         varchar(255) NOT NULL,
    name                           varchar(255) NOT NULL,
    logo                           varchar(255) NOT NULL,
    description                    varchar(255) NULL     DEFAULT NULL,
    status                         int2         NOT NULL,
    access_token_validity_seconds  int4         NOT NULL,
    refresh_token_validity_seconds int4         NOT NULL,
    redirect_uris                  varchar(255) NOT NULL,
    authorized_grant_types         varchar(255) NOT NULL,
    scopes                         varchar(255) NULL     DEFAULT NULL,
    auto_approve_scopes            varchar(255) NULL     DEFAULT NULL,
    authorities                    varchar(255) NULL     DEFAULT NULL,
    resource_ids                   varchar(255) NULL     DEFAULT NULL,
    additional_information         varchar(4096) NULL     DEFAULT NULL,
    creator                        varchar(64) NULL     DEFAULT '',
    create_time                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater                        varchar(64) NULL     DEFAULT '',
    update_time                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted                        int2         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_oauth2_client.id IS '编号';
COMMENT
ON COLUMN system_oauth2_client.client_id IS '客户端编号';
COMMENT
ON COLUMN system_oauth2_client.secret IS '客户端密钥';
COMMENT
ON COLUMN system_oauth2_client.name IS '应用名';
COMMENT
ON COLUMN system_oauth2_client.logo IS '应用图标';
COMMENT
ON COLUMN system_oauth2_client.description IS '应用描述';
COMMENT
ON COLUMN system_oauth2_client.status IS '状态';
COMMENT
ON COLUMN system_oauth2_client.access_token_validity_seconds IS '访问令牌的有效期';
COMMENT
ON COLUMN system_oauth2_client.refresh_token_validity_seconds IS '刷新令牌的有效期';
COMMENT
ON COLUMN system_oauth2_client.redirect_uris IS '可重定向的 URI 地址';
COMMENT
ON COLUMN system_oauth2_client.authorized_grant_types IS '授权类型';
COMMENT
ON COLUMN system_oauth2_client.scopes IS '授权范围';
COMMENT
ON COLUMN system_oauth2_client.auto_approve_scopes IS '自动通过的授权范围';
COMMENT
ON COLUMN system_oauth2_client.authorities IS '权限';
COMMENT
ON COLUMN system_oauth2_client.resource_ids IS '资源';
COMMENT
ON COLUMN system_oauth2_client.additional_information IS '附加信息';
COMMENT
ON COLUMN system_oauth2_client.creator IS '创建者';
COMMENT
ON COLUMN system_oauth2_client.create_time IS '创建时间';
COMMENT
ON COLUMN system_oauth2_client.updater IS '更新者';
COMMENT
ON COLUMN system_oauth2_client.update_time IS '更新时间';
COMMENT
ON COLUMN system_oauth2_client.deleted IS '是否删除';
COMMENT
ON TABLE system_oauth2_client IS 'OAuth2 客户端表';



DROP TABLE IF EXISTS system_oauth2_code;
CREATE TABLE system_oauth2_code
(
    id           BIGSERIAL PRIMARY KEY,
    user_id      int8         NOT NULL,
    user_type    int2         NOT NULL,
    code         varchar(32)  NOT NULL,
    client_id    varchar(255) NOT NULL,
    scopes       varchar(255) NULL     DEFAULT '',
    expires_time timestamp    NOT NULL,
    redirect_uri varchar(255) NULL     DEFAULT NULL,
    state        varchar(255) NOT NULL DEFAULT '',
    creator      varchar(64) NULL     DEFAULT '',
    create_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater      varchar(64) NULL     DEFAULT '',
    update_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted      int2         NOT NULL DEFAULT 0,
    tenant_id    int8         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_oauth2_code.id IS '编号';
COMMENT
ON COLUMN system_oauth2_code.user_id IS '用户编号';
COMMENT
ON COLUMN system_oauth2_code.user_type IS '用户类型';
COMMENT
ON COLUMN system_oauth2_code.code IS '授权码';
COMMENT
ON COLUMN system_oauth2_code.client_id IS '客户端编号';
COMMENT
ON COLUMN system_oauth2_code.scopes IS '授权范围';
COMMENT
ON COLUMN system_oauth2_code.expires_time IS '过期时间';
COMMENT
ON COLUMN system_oauth2_code.redirect_uri IS '可重定向的 URI 地址';
COMMENT
ON COLUMN system_oauth2_code.state IS '状态';
COMMENT
ON COLUMN system_oauth2_code.creator IS '创建者';
COMMENT
ON COLUMN system_oauth2_code.create_time IS '创建时间';
COMMENT
ON COLUMN system_oauth2_code.updater IS '更新者';
COMMENT
ON COLUMN system_oauth2_code.update_time IS '更新时间';
COMMENT
ON COLUMN system_oauth2_code.deleted IS '是否删除';
COMMENT
ON COLUMN system_oauth2_code.tenant_id IS '租户编号';
COMMENT
ON TABLE system_oauth2_code IS 'OAuth2 授权码表';



DROP TABLE IF EXISTS system_oauth2_refresh_token;
CREATE TABLE system_oauth2_refresh_token
(
    id            BIGSERIAL PRIMARY KEY,
    user_id       int8         NOT NULL,
    refresh_token varchar(32)  NOT NULL,
    user_type     int2         NOT NULL,
    client_id     varchar(255) NOT NULL,
    scopes        varchar(255) NULL     DEFAULT NULL,
    expires_time  timestamp    NOT NULL,
    creator       varchar(64) NULL     DEFAULT '',
    create_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater       varchar(64) NULL     DEFAULT '',
    update_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted       int2         NOT NULL DEFAULT 0,
    tenant_id     int8         NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_oauth2_refresh_token.id IS '编号';
COMMENT
ON COLUMN system_oauth2_refresh_token.user_id IS '用户编号';
COMMENT
ON COLUMN system_oauth2_refresh_token.refresh_token IS '刷新令牌';
COMMENT
ON COLUMN system_oauth2_refresh_token.user_type IS '用户类型';
COMMENT
ON COLUMN system_oauth2_refresh_token.client_id IS '客户端编号';
COMMENT
ON COLUMN system_oauth2_refresh_token.scopes IS '授权范围';
COMMENT
ON COLUMN system_oauth2_refresh_token.expires_time IS '过期时间';
COMMENT
ON COLUMN system_oauth2_refresh_token.creator IS '创建者';
COMMENT
ON COLUMN system_oauth2_refresh_token.create_time IS '创建时间';
COMMENT
ON COLUMN system_oauth2_refresh_token.updater IS '更新者';
COMMENT
ON COLUMN system_oauth2_refresh_token.update_time IS '更新时间';
COMMENT
ON COLUMN system_oauth2_refresh_token.deleted IS '是否删除';
COMMENT
ON COLUMN system_oauth2_refresh_token.tenant_id IS '租户编号';
COMMENT
ON TABLE system_oauth2_refresh_token IS 'OAuth2 刷新令牌';



DROP TABLE IF EXISTS system_operate_log;
CREATE TABLE system_operate_log
(
    id             BIGSERIAL PRIMARY KEY,
    trace_id       varchar(64)   NOT NULL DEFAULT '',
    user_id        int8          NOT NULL,
    user_type      int2          NOT NULL DEFAULT 0,
    type           varchar(50)   NOT NULL,
    sub_type       varchar(50)   NOT NULL,
    biz_id         int8          NOT NULL,
    action         varchar(2000) NOT NULL DEFAULT '',
    success        bool          NOT NULL DEFAULT '1',
    extra          varchar(2000) NOT NULL DEFAULT '',
    request_method varchar(16) NULL     DEFAULT '',
    request_url    varchar(255) NULL     DEFAULT '',
    user_ip        varchar(50) NULL     DEFAULT NULL,
    user_agent     varchar(512) NULL     DEFAULT NULL,
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2          NOT NULL DEFAULT 0,
    tenant_id      int8          NOT NULL DEFAULT 0
);

COMMENT
ON COLUMN system_operate_log.id IS '日志主键';
COMMENT
ON COLUMN system_operate_log.trace_id IS '链路追踪编号';
COMMENT
ON COLUMN system_operate_log.user_id IS '用户编号';
COMMENT
ON COLUMN system_operate_log.user_type IS '用户类型';
COMMENT
ON COLUMN system_operate_log.type IS '操作模块类型';
COMMENT
ON COLUMN system_operate_log.sub_type IS '操作名';
COMMENT
ON COLUMN system_operate_log.biz_id IS '操作数据模块编号';
COMMENT
ON COLUMN system_operate_log.action IS '操作内容';
COMMENT
ON COLUMN system_operate_log.success IS '操作结果';
COMMENT
ON COLUMN system_operate_log.extra IS '拓展字段';
COMMENT
ON COLUMN system_operate_log.request_method IS '请求方法名';
COMMENT
ON COLUMN system_operate_log.request_url IS '请求地址';
COMMENT
ON COLUMN system_operate_log.user_ip IS '用户 IP';
COMMENT
ON COLUMN system_operate_log.user_agent IS '浏览器 UA';
COMMENT
ON COLUMN system_operate_log.creator IS '创建者';
COMMENT
ON COLUMN system_operate_log.create_time IS '创建时间';
COMMENT
ON COLUMN system_operate_log.updater IS '更新者';
COMMENT
ON COLUMN system_operate_log.update_time IS '更新时间';
COMMENT
ON COLUMN system_operate_log.deleted IS '是否删除';
COMMENT
ON COLUMN system_operate_log.tenant_id IS '租户编号';
COMMENT
ON TABLE system_operate_log IS '操作日志记录 V2 版本';



DROP TABLE IF EXISTS system_post;
CREATE TABLE system_post
(
    id          BIGSERIAL PRIMARY KEY,
    code        varchar(64) NOT NULL,
    name        varchar(50) NOT NULL,
    sort        int4        NOT NULL,
    status      int2        NOT NULL,
    remark      varchar(500) NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2        NOT NULL DEFAULT 0,
    tenant_id   int8        NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_post.id IS '岗位ID';
COMMENT
ON COLUMN system_post.code IS '岗位编码';
COMMENT
ON COLUMN system_post.name IS '岗位名称';
COMMENT
ON COLUMN system_post.sort IS '显示顺序';
COMMENT
ON COLUMN system_post.status IS '状态（0正常 1停用）';
COMMENT
ON COLUMN system_post.remark IS '备注';
COMMENT
ON COLUMN system_post.creator IS '创建者';
COMMENT
ON COLUMN system_post.create_time IS '创建时间';
COMMENT
ON COLUMN system_post.updater IS '更新者';
COMMENT
ON COLUMN system_post.update_time IS '更新时间';
COMMENT
ON COLUMN system_post.deleted IS '是否删除';
COMMENT
ON COLUMN system_post.tenant_id IS '租户编号';
COMMENT
ON TABLE system_post IS '岗位信息表';



DROP TABLE IF EXISTS system_role;
CREATE TABLE system_role
(
    id                  BIGSERIAL PRIMARY KEY,
    name                varchar(30)  NOT NULL,
    code                varchar(100) NOT NULL,
    sort                int4         NOT NULL,
    data_scope          int2         NOT NULL DEFAULT 1,
    data_scope_dept_ids varchar(500) NOT NULL DEFAULT '',
    status              int2         NOT NULL,
    type                int2         NOT NULL,
    remark              varchar(500) NULL     DEFAULT NULL,
    creator             varchar(64) NULL     DEFAULT '',
    create_time         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater             varchar(64) NULL     DEFAULT '',
    update_time         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted             int2         NOT NULL DEFAULT 0,
    tenant_id           int8         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_role.id IS '角色ID';
COMMENT
ON COLUMN system_role.name IS '角色名称';
COMMENT
ON COLUMN system_role.code IS '角色权限字符串';
COMMENT
ON COLUMN system_role.sort IS '显示顺序';
COMMENT
ON COLUMN system_role.data_scope IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
COMMENT
ON COLUMN system_role.data_scope_dept_ids IS '数据范围 ( 指定部门数组)';
COMMENT
ON COLUMN system_role.status IS '角色状态（0正常 1停用）';
COMMENT
ON COLUMN system_role.type IS '角色类型';
COMMENT
ON COLUMN system_role.remark IS '备注';
COMMENT
ON COLUMN system_role.creator IS '创建者';
COMMENT
ON COLUMN system_role.create_time IS '创建时间';
COMMENT
ON COLUMN system_role.updater IS '更新者';
COMMENT
ON COLUMN system_role.update_time IS '更新时间';
COMMENT
ON COLUMN system_role.deleted IS '是否删除';
COMMENT
ON COLUMN system_role.tenant_id IS '租户编号';
COMMENT
ON TABLE system_role IS '角色信息表';



DROP TABLE IF EXISTS system_role_menu;
CREATE TABLE system_role_menu
(
    id          BIGSERIAL PRIMARY KEY,
    role_id     int8      NOT NULL,
    menu_id     int8      NOT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2      NOT NULL DEFAULT 0,
    tenant_id   int8      NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_role_menu.id IS '自增编号';
COMMENT
ON COLUMN system_role_menu.role_id IS '角色ID';
COMMENT
ON COLUMN system_role_menu.menu_id IS '菜单ID';
COMMENT
ON COLUMN system_role_menu.creator IS '创建者';
COMMENT
ON COLUMN system_role_menu.create_time IS '创建时间';
COMMENT
ON COLUMN system_role_menu.updater IS '更新者';
COMMENT
ON COLUMN system_role_menu.update_time IS '更新时间';
COMMENT
ON COLUMN system_role_menu.deleted IS '是否删除';
COMMENT
ON COLUMN system_role_menu.tenant_id IS '租户编号';
COMMENT
ON TABLE system_role_menu IS '角色和菜单关联表';



DROP TABLE IF EXISTS system_sms_channel;
CREATE TABLE system_sms_channel
(
    id           BIGSERIAL PRIMARY KEY,
    signature    varchar(12)  NOT NULL,
    code         varchar(63)  NOT NULL,
    status       int2         NOT NULL,
    remark       varchar(255) NULL     DEFAULT NULL,
    api_key      varchar(128) NOT NULL,
    api_secret   varchar(128) NULL     DEFAULT NULL,
    callback_url varchar(255) NULL     DEFAULT NULL,
    creator      varchar(64) NULL     DEFAULT '',
    create_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater      varchar(64) NULL     DEFAULT '',
    update_time  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted      int2         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_sms_channel.id IS '编号';
COMMENT
ON COLUMN system_sms_channel.signature IS '短信签名';
COMMENT
ON COLUMN system_sms_channel.code IS '渠道编码';
COMMENT
ON COLUMN system_sms_channel.status IS '开启状态';
COMMENT
ON COLUMN system_sms_channel.remark IS '备注';
COMMENT
ON COLUMN system_sms_channel.api_key IS '短信 API 的账号';
COMMENT
ON COLUMN system_sms_channel.api_secret IS '短信 API 的秘钥';
COMMENT
ON COLUMN system_sms_channel.callback_url IS '短信发送回调 URL';
COMMENT
ON COLUMN system_sms_channel.creator IS '创建者';
COMMENT
ON COLUMN system_sms_channel.create_time IS '创建时间';
COMMENT
ON COLUMN system_sms_channel.updater IS '更新者';
COMMENT
ON COLUMN system_sms_channel.update_time IS '更新时间';
COMMENT
ON COLUMN system_sms_channel.deleted IS '是否删除';
COMMENT
ON TABLE system_sms_channel IS '短信渠道';



DROP TABLE IF EXISTS system_sms_code;
CREATE TABLE system_sms_code
(
    id          BIGSERIAL PRIMARY KEY,
    mobile      varchar(11) NOT NULL,
    code        varchar(6)  NOT NULL,
    create_ip   varchar(15) NOT NULL,
    scene       int2        NOT NULL,
    today_index int2        NOT NULL,
    used        int2        NOT NULL,
    used_time   timestamp NULL     DEFAULT NULL,
    used_ip     varchar(255) NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2        NOT NULL DEFAULT 0,
    tenant_id   int8        NOT NULL DEFAULT 0
);
CREATE INDEX idx_system_sms_code_01 ON system_sms_code (mobile);

COMMENT
ON COLUMN system_sms_code.id IS '编号';
COMMENT
ON COLUMN system_sms_code.mobile IS '手机号';
COMMENT
ON COLUMN system_sms_code.code IS '验证码';
COMMENT
ON COLUMN system_sms_code.create_ip IS '创建 IP';
COMMENT
ON COLUMN system_sms_code.scene IS '发送场景';
COMMENT
ON COLUMN system_sms_code.today_index IS '今日发送的第几条';
COMMENT
ON COLUMN system_sms_code.used IS '是否使用';
COMMENT
ON COLUMN system_sms_code.used_time IS '使用时间';
COMMENT
ON COLUMN system_sms_code.used_ip IS '使用 IP';
COMMENT
ON COLUMN system_sms_code.creator IS '创建者';
COMMENT
ON COLUMN system_sms_code.create_time IS '创建时间';
COMMENT
ON COLUMN system_sms_code.updater IS '更新者';
COMMENT
ON COLUMN system_sms_code.update_time IS '更新时间';
COMMENT
ON COLUMN system_sms_code.deleted IS '是否删除';
COMMENT
ON COLUMN system_sms_code.tenant_id IS '租户编号';
COMMENT
ON TABLE system_sms_code IS '手机验证码';



DROP TABLE IF EXISTS system_sms_log;
CREATE TABLE system_sms_log
(
    id               BIGSERIAL PRIMARY KEY,
    channel_id       int8         NOT NULL,
    channel_code     varchar(63)  NOT NULL,
    template_id      int8         NOT NULL,
    template_code    varchar(63)  NOT NULL,
    template_type    int2         NOT NULL,
    template_content varchar(255) NOT NULL,
    template_params  varchar(255) NOT NULL,
    api_template_id  varchar(63)  NOT NULL,
    mobile           varchar(11)  NOT NULL,
    user_id          int8 NULL     DEFAULT NULL,
    user_type        int2 NULL     DEFAULT NULL,
    send_status      int2         NOT NULL DEFAULT 0,
    send_time        timestamp NULL     DEFAULT NULL,
    api_send_code    varchar(63) NULL     DEFAULT NULL,
    api_send_msg     varchar(255) NULL     DEFAULT NULL,
    api_request_id   varchar(255) NULL     DEFAULT NULL,
    api_serial_no    varchar(255) NULL     DEFAULT NULL,
    receive_status   int2         NOT NULL DEFAULT 0,
    receive_time     timestamp NULL     DEFAULT NULL,
    api_receive_code varchar(63) NULL     DEFAULT NULL,
    api_receive_msg  varchar(255) NULL     DEFAULT NULL,
    creator          varchar(64) NULL     DEFAULT '',
    create_time      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater          varchar(64) NULL     DEFAULT '',
    update_time      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted          int2         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_sms_log.id IS '编号';
COMMENT
ON COLUMN system_sms_log.channel_id IS '短信渠道编号';
COMMENT
ON COLUMN system_sms_log.channel_code IS '短信渠道编码';
COMMENT
ON COLUMN system_sms_log.template_id IS '模板编号';
COMMENT
ON COLUMN system_sms_log.template_code IS '模板编码';
COMMENT
ON COLUMN system_sms_log.template_type IS '短信类型';
COMMENT
ON COLUMN system_sms_log.template_content IS '短信内容';
COMMENT
ON COLUMN system_sms_log.template_params IS '短信参数';
COMMENT
ON COLUMN system_sms_log.api_template_id IS '短信 API 的模板编号';
COMMENT
ON COLUMN system_sms_log.mobile IS '手机号';
COMMENT
ON COLUMN system_sms_log.user_id IS '用户编号';
COMMENT
ON COLUMN system_sms_log.user_type IS '用户类型';
COMMENT
ON COLUMN system_sms_log.send_status IS '发送状态';
COMMENT
ON COLUMN system_sms_log.send_time IS '发送时间';
COMMENT
ON COLUMN system_sms_log.api_send_code IS '短信 API 发送结果的编码';
COMMENT
ON COLUMN system_sms_log.api_send_msg IS '短信 API 发送失败的提示';
COMMENT
ON COLUMN system_sms_log.api_request_id IS '短信 API 发送返回的唯一请求 ID';
COMMENT
ON COLUMN system_sms_log.api_serial_no IS '短信 API 发送返回的序号';
COMMENT
ON COLUMN system_sms_log.receive_status IS '接收状态';
COMMENT
ON COLUMN system_sms_log.receive_time IS '接收时间';
COMMENT
ON COLUMN system_sms_log.api_receive_code IS 'API 接收结果的编码';
COMMENT
ON COLUMN system_sms_log.api_receive_msg IS 'API 接收结果的说明';
COMMENT
ON COLUMN system_sms_log.creator IS '创建者';
COMMENT
ON COLUMN system_sms_log.create_time IS '创建时间';
COMMENT
ON COLUMN system_sms_log.updater IS '更新者';
COMMENT
ON COLUMN system_sms_log.update_time IS '更新时间';
COMMENT
ON COLUMN system_sms_log.deleted IS '是否删除';
COMMENT
ON TABLE system_sms_log IS '短信日志';



DROP TABLE IF EXISTS system_sms_template;
CREATE TABLE system_sms_template
(
    id              BIGSERIAL PRIMARY KEY,
    type            int2         NOT NULL,
    status          int2         NOT NULL,
    code            varchar(63)  NOT NULL,
    name            varchar(63)  NOT NULL,
    content         varchar(255) NOT NULL,
    params          varchar(255) NOT NULL,
    remark          varchar(255) NULL     DEFAULT NULL,
    api_template_id varchar(63)  NOT NULL,
    channel_id      int8         NOT NULL,
    channel_code    varchar(63)  NOT NULL,
    creator         varchar(64) NULL     DEFAULT '',
    create_time     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater         varchar(64) NULL     DEFAULT '',
    update_time     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted         int2         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_sms_template.id IS '编号';
COMMENT
ON COLUMN system_sms_template.type IS '模板类型';
COMMENT
ON COLUMN system_sms_template.status IS '开启状态';
COMMENT
ON COLUMN system_sms_template.code IS '模板编码';
COMMENT
ON COLUMN system_sms_template.name IS '模板名称';
COMMENT
ON COLUMN system_sms_template.content IS '模板内容';
COMMENT
ON COLUMN system_sms_template.params IS '参数数组';
COMMENT
ON COLUMN system_sms_template.remark IS '备注';
COMMENT
ON COLUMN system_sms_template.api_template_id IS '短信 API 的模板编号';
COMMENT
ON COLUMN system_sms_template.channel_id IS '短信渠道编号';
COMMENT
ON COLUMN system_sms_template.channel_code IS '短信渠道编码';
COMMENT
ON COLUMN system_sms_template.creator IS '创建者';
COMMENT
ON COLUMN system_sms_template.create_time IS '创建时间';
COMMENT
ON COLUMN system_sms_template.updater IS '更新者';
COMMENT
ON COLUMN system_sms_template.update_time IS '更新时间';
COMMENT
ON COLUMN system_sms_template.deleted IS '是否删除';
COMMENT
ON TABLE system_sms_template IS '短信模板';



DROP TABLE IF EXISTS system_social_client;
CREATE TABLE system_social_client
(
    id            BIGSERIAL PRIMARY KEY,
    name          varchar(255) NOT NULL,
    social_type   int2         NOT NULL,
    user_type     int2         NOT NULL,
    client_id     varchar(255) NOT NULL,
    client_secret varchar(255) NOT NULL,
    agent_id      varchar(255) NULL     DEFAULT NULL,
    status        int2         NOT NULL,
    creator       varchar(64) NULL     DEFAULT '',
    create_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater       varchar(64) NULL     DEFAULT '',
    update_time   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted       int2         NOT NULL DEFAULT 0,
    tenant_id     int8         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_social_client.id IS '编号';
COMMENT
ON COLUMN system_social_client.name IS '应用名';
COMMENT
ON COLUMN system_social_client.social_type IS '社交平台的类型';
COMMENT
ON COLUMN system_social_client.user_type IS '用户类型';
COMMENT
ON COLUMN system_social_client.client_id IS '客户端编号';
COMMENT
ON COLUMN system_social_client.client_secret IS '客户端密钥';
COMMENT
ON COLUMN system_social_client.agent_id IS '代理编号';
COMMENT
ON COLUMN system_social_client.status IS '状态';
COMMENT
ON COLUMN system_social_client.creator IS '创建者';
COMMENT
ON COLUMN system_social_client.create_time IS '创建时间';
COMMENT
ON COLUMN system_social_client.updater IS '更新者';
COMMENT
ON COLUMN system_social_client.update_time IS '更新时间';
COMMENT
ON COLUMN system_social_client.deleted IS '是否删除';
COMMENT
ON COLUMN system_social_client.tenant_id IS '租户编号';
COMMENT
ON TABLE system_social_client IS '社交客户端表';



DROP TABLE IF EXISTS system_social_user;
CREATE TABLE system_social_user
(
    id             BIGSERIAL PRIMARY KEY,
    type           int2          NOT NULL,
    openid         varchar(32)   NOT NULL,
    token          varchar(256) NULL     DEFAULT NULL,
    raw_token_info varchar(1024) NOT NULL,
    nickname       varchar(32)   NOT NULL,
    avatar         varchar(255) NULL     DEFAULT NULL,
    raw_user_info  varchar(1024) NOT NULL,
    code           varchar(256)  NOT NULL,
    state          varchar(256) NULL     DEFAULT NULL,
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2          NOT NULL DEFAULT 0,
    tenant_id      int8          NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_social_user.id IS '主键 ( 自增策略)';
COMMENT
ON COLUMN system_social_user.type IS '社交平台的类型';
COMMENT
ON COLUMN system_social_user.openid IS '社交 openid';
COMMENT
ON COLUMN system_social_user.token IS '社交 token';
COMMENT
ON COLUMN system_social_user.raw_token_info IS '原始 Token 数据，一般是 JSON 格式';
COMMENT
ON COLUMN system_social_user.nickname IS '用户昵称';
COMMENT
ON COLUMN system_social_user.avatar IS '用户头像';
COMMENT
ON COLUMN system_social_user.raw_user_info IS '原始用户数据，一般是 JSON 格式';
COMMENT
ON COLUMN system_social_user.code IS '最后一次的认证 code';
COMMENT
ON COLUMN system_social_user.state IS '最后一次的认证 state';
COMMENT
ON COLUMN system_social_user.creator IS '创建者';
COMMENT
ON COLUMN system_social_user.create_time IS '创建时间';
COMMENT
ON COLUMN system_social_user.updater IS '更新者';
COMMENT
ON COLUMN system_social_user.update_time IS '更新时间';
COMMENT
ON COLUMN system_social_user.deleted IS '是否删除';
COMMENT
ON COLUMN system_social_user.tenant_id IS '租户编号';
COMMENT
ON TABLE system_social_user IS '社交用户表';



DROP TABLE IF EXISTS system_social_user_bind;
CREATE TABLE system_social_user_bind
(
    id             BIGSERIAL PRIMARY KEY,
    user_id        int8      NOT NULL,
    user_type      int2      NOT NULL,
    social_type    int2      NOT NULL,
    social_user_id int8      NOT NULL,
    creator        varchar(64) NULL     DEFAULT '',
    create_time    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater        varchar(64) NULL     DEFAULT '',
    update_time    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted        int2      NOT NULL DEFAULT 0,
    tenant_id      int8      NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_social_user_bind.id IS '主键 ( 自增策略)';
COMMENT
ON COLUMN system_social_user_bind.user_id IS '用户编号';
COMMENT
ON COLUMN system_social_user_bind.user_type IS '用户类型';
COMMENT
ON COLUMN system_social_user_bind.social_type IS '社交平台的类型';
COMMENT
ON COLUMN system_social_user_bind.social_user_id IS '社交用户的编号';
COMMENT
ON COLUMN system_social_user_bind.creator IS '创建者';
COMMENT
ON COLUMN system_social_user_bind.create_time IS '创建时间';
COMMENT
ON COLUMN system_social_user_bind.updater IS '更新者';
COMMENT
ON COLUMN system_social_user_bind.update_time IS '更新时间';
COMMENT
ON COLUMN system_social_user_bind.deleted IS '是否删除';
COMMENT
ON COLUMN system_social_user_bind.tenant_id IS '租户编号';
COMMENT
ON TABLE system_social_user_bind IS '社交绑定表';



DROP TABLE IF EXISTS system_tenant;
CREATE TABLE system_tenant
(
    id              BIGSERIAL PRIMARY KEY,
    name            varchar(30) NOT NULL,
    contact_user_id int8 NULL     DEFAULT NULL,
    contact_name    varchar(30) NOT NULL,
    contact_mobile  varchar(500) NULL     DEFAULT NULL,
    status          int2        NOT NULL DEFAULT 0,
    websites        varchar(256) NULL     DEFAULT '',
    package_id      int8        NOT NULL,
    expire_time     timestamp   NOT NULL,
    account_count   int4        NOT NULL,
    creator         varchar(64) NOT NULL DEFAULT '',
    create_time     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater         varchar(64) NULL     DEFAULT '',
    update_time     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted         int2        NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_tenant.id IS '租户编号';
COMMENT
ON COLUMN system_tenant.name IS '租户名';
COMMENT
ON COLUMN system_tenant.contact_user_id IS '联系人的用户编号';
COMMENT
ON COLUMN system_tenant.contact_name IS '联系人';
COMMENT
ON COLUMN system_tenant.contact_mobile IS '联系手机';
COMMENT
ON COLUMN system_tenant.status IS '租户状态（0正常 1停用）';
COMMENT
ON COLUMN system_tenant.websites IS '绑定域名数组';
COMMENT
ON COLUMN system_tenant.package_id IS '租户套餐编号';
COMMENT
ON COLUMN system_tenant.expire_time IS '过期时间';
COMMENT
ON COLUMN system_tenant.account_count IS '账号数量';
COMMENT
ON COLUMN system_tenant.creator IS '创建者';
COMMENT
ON COLUMN system_tenant.create_time IS '创建时间';
COMMENT
ON COLUMN system_tenant.updater IS '更新者';
COMMENT
ON COLUMN system_tenant.update_time IS '更新时间';
COMMENT
ON COLUMN system_tenant.deleted IS '是否删除';
COMMENT
ON TABLE system_tenant IS '租户表';



DROP TABLE IF EXISTS system_tenant_package;
CREATE TABLE system_tenant_package
(
    id          BIGSERIAL PRIMARY KEY,
    name        varchar(30)   NOT NULL,
    status      int2          NOT NULL DEFAULT 0,
    remark      varchar(256) NULL     DEFAULT '',
    menu_ids    varchar(4096) NOT NULL,
    creator     varchar(64)   NOT NULL DEFAULT '',
    create_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2          NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_tenant_package.id IS '套餐编号';
COMMENT
ON COLUMN system_tenant_package.name IS '套餐名';
COMMENT
ON COLUMN system_tenant_package.status IS '租户状态（0正常 1停用）';
COMMENT
ON COLUMN system_tenant_package.remark IS '备注';
COMMENT
ON COLUMN system_tenant_package.menu_ids IS '关联的菜单编号';
COMMENT
ON COLUMN system_tenant_package.creator IS '创建者';
COMMENT
ON COLUMN system_tenant_package.create_time IS '创建时间';
COMMENT
ON COLUMN system_tenant_package.updater IS '更新者';
COMMENT
ON COLUMN system_tenant_package.update_time IS '更新时间';
COMMENT
ON COLUMN system_tenant_package.deleted IS '是否删除';
COMMENT
ON TABLE system_tenant_package IS '租户套餐表';



DROP TABLE IF EXISTS system_user_post;
CREATE TABLE system_user_post
(
    id          BIGSERIAL PRIMARY KEY,
    user_id     int8      NOT NULL DEFAULT 0,
    post_id     int8      NOT NULL DEFAULT 0,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2      NOT NULL DEFAULT 0,
    tenant_id   int8      NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_user_post.id IS 'id';
COMMENT
ON COLUMN system_user_post.user_id IS '用户ID';
COMMENT
ON COLUMN system_user_post.post_id IS '岗位ID';
COMMENT
ON COLUMN system_user_post.creator IS '创建者';
COMMENT
ON COLUMN system_user_post.create_time IS '创建时间';
COMMENT
ON COLUMN system_user_post.updater IS '更新者';
COMMENT
ON COLUMN system_user_post.update_time IS '更新时间';
COMMENT
ON COLUMN system_user_post.deleted IS '是否删除';
COMMENT
ON COLUMN system_user_post.tenant_id IS '租户编号';
COMMENT
ON TABLE system_user_post IS '用户岗位表';



DROP TABLE IF EXISTS system_user_role;
CREATE TABLE system_user_role
(
    id          BIGSERIAL PRIMARY KEY,
    user_id     int8 NOT NULL,
    role_id     int8 NOT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp NULL     DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp NULL     DEFAULT CURRENT_TIMESTAMP,
    deleted     int2 NOT NULL DEFAULT 0,
    tenant_id   int8 NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_user_role.id IS '自增编号';
COMMENT
ON COLUMN system_user_role.user_id IS '用户ID';
COMMENT
ON COLUMN system_user_role.role_id IS '角色ID';
COMMENT
ON COLUMN system_user_role.creator IS '创建者';
COMMENT
ON COLUMN system_user_role.create_time IS '创建时间';
COMMENT
ON COLUMN system_user_role.updater IS '更新者';
COMMENT
ON COLUMN system_user_role.update_time IS '更新时间';
COMMENT
ON COLUMN system_user_role.deleted IS '是否删除';
COMMENT
ON COLUMN system_user_role.tenant_id IS '租户编号';
COMMENT
ON TABLE system_user_role IS '用户和角色关联表';



DROP TABLE IF EXISTS system_users;
CREATE TABLE system_users
(
    id          BIGSERIAL PRIMARY KEY,
    username    varchar(30)  NOT NULL,
    password    varchar(100) NOT NULL DEFAULT '',
    nickname    varchar(30)  NOT NULL,
    remark      varchar(500) NULL     DEFAULT NULL,
    dept_id     int8 NULL     DEFAULT NULL,
    post_ids    varchar(255) NULL     DEFAULT NULL,
    email       varchar(50) NULL     DEFAULT '',
    mobile      varchar(11) NULL     DEFAULT '',
    sex         int2 NULL     DEFAULT 0,
    avatar      varchar(512) NULL     DEFAULT '',
    status      int2         NOT NULL DEFAULT 0,
    login_ip    varchar(50) NULL     DEFAULT '',
    login_date  timestamp NULL     DEFAULT NULL,
    creator     varchar(64) NULL     DEFAULT '',
    create_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updater     varchar(64) NULL     DEFAULT '',
    update_time timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted     int2         NOT NULL DEFAULT 0,
    tenant_id   int8         NOT NULL DEFAULT 0
);
COMMENT
ON COLUMN system_users.id IS '用户ID';
COMMENT
ON COLUMN system_users.username IS '用户账号';
COMMENT
ON COLUMN system_users.password IS '密码';
COMMENT
ON COLUMN system_users.nickname IS '用户昵称';
COMMENT
ON COLUMN system_users.remark IS '备注';
COMMENT
ON COLUMN system_users.dept_id IS '部门ID';
COMMENT
ON COLUMN system_users.post_ids IS '岗位编号数组';
COMMENT
ON COLUMN system_users.email IS '用户邮箱';
COMMENT
ON COLUMN system_users.mobile IS '手机号码';
COMMENT
ON COLUMN system_users.sex IS '用户性别';
COMMENT
ON COLUMN system_users.avatar IS '头像地址';
COMMENT
ON COLUMN system_users.status IS '帐号状态（0正常 1停用）';
COMMENT
ON COLUMN system_users.login_ip IS '最后登录IP';
COMMENT
ON COLUMN system_users.login_date IS '最后登录时间';
COMMENT
ON COLUMN system_users.creator IS '创建者';
COMMENT
ON COLUMN system_users.create_time IS '创建时间';
COMMENT
ON COLUMN system_users.updater IS '更新者';
COMMENT
ON COLUMN system_users.update_time IS '更新时间';
COMMENT
ON COLUMN system_users.deleted IS '是否删除';
COMMENT
ON COLUMN system_users.tenant_id IS '租户编号';
COMMENT
ON TABLE system_users IS '用户信息表';

