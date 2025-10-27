use salvo::handler;
use daoyi_common::common::CommonResult;

/// 404 Not Found 处理器
#[handler]
pub async fn handle_404() -> CommonResult<()> {
    CommonResult::<()>::error(404, "接口不存在")
}