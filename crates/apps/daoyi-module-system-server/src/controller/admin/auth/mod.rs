use daoyi_common::common::CommonResult;
use salvo::Router;
use salvo::prelude::*;

pub(crate) fn create_router() -> Router {
    Router::with_path("auth").push(Router::with_path("login").post(login))
}

/// 使用账号密码登录
#[endpoint(
    tags("管理后台 - 认证"),
    summary = "使用账号密码登录",
    responses(
        (status_code = 200, description = "Success", body = CommonResult<i64>),
    ),
)]
async fn login() -> CommonResult<i64> {
    CommonResult::<i64>::error(2,"暂不支持登录")
}