use salvo::oapi::endpoint;
use salvo::Router;

pub(crate) fn create_router() -> Router {
    Router::with_path("tenant").push(Router::with_path("get-id-by-name").get(get_tenant_id_by_name))
}
#[endpoint]
async fn get_tenant_id_by_name() -> &'static str {
    "get_tenant_id_by_name"
}
