use daoyi_common::common::CommonResult;
use salvo::Router;
use salvo::oapi::endpoint;

pub(crate) fn create_router() -> Router {
    Router::with_path("tenant").push(Router::with_path("get-id-by-name").get(get_tenant_id_by_name))
}

/// 使用租户名，获得租户编号
#[endpoint(
    tags("管理后台 - 租户"),
    summary = "登录界面，根据用户的租户名，获得租户编号",
    responses(
        (status_code = 200, description = "Success", body = CommonResult<String>),
    ),
)]
async fn get_tenant_id_by_name() -> CommonResult<String> {
    CommonResult::success(String::from("123"))
}
