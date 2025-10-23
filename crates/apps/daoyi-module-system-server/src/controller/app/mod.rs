use salvo::Router;

pub(crate) mod tenant;
pub(crate) fn create_router() -> Router {
    Router::with_path("system").push(tenant::create_router())
}
