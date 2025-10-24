use daoyi_common::common::conf;
use salvo::conn::TcpListener;
use salvo::oapi::OpenApi;
use salvo::prelude::{Scalar, SwaggerUi};
use salvo::{Listener, Router, Server};

pub async fn start(router: Router) -> anyhow::Result<()> {
    let c = conf::get().await;
    let doc = OpenApi::new("salvo web api", "0.0.1").merge_router(&router);
    let router = router
        .unshift(doc.into_router("/api-doc/openapi.json"))
        .unshift(Scalar::new("/api-doc/openapi.json").into_router("scalar"))
        .unshift(SwaggerUi::new("/api-doc/openapi.json").into_router("swagger"));
    let acceptor = TcpListener::new(format!("0.0.0.0:{}", c.server().port()))
        .bind()
        .await;
    Server::new(acceptor).serve(router).await;
    Ok(())
}
