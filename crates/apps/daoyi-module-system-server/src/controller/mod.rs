use salvo::Router;

pub(crate) mod admin;
pub(crate) mod app;

pub(crate) fn create_router() -> Router {
    Router::new()
        .push(Router::with_path("admin-api").push(admin::create_router()))
        .push(Router::with_path("app-api").push(app::create_router()))
}
