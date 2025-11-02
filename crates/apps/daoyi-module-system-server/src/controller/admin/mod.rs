use salvo::Router;

pub(crate) mod auth;
pub(crate) mod tenant;

pub(crate) fn create_router() -> Router {
    Router::with_path("system")
        .push(auth::create_router())
        .push(tenant::create_router())
}