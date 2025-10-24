use daoyi_common::common::conf;
use salvo::conn::{Acceptor, TcpListener};
use salvo::oapi::OpenApi;
use salvo::prelude::{Scalar, SwaggerUi};
use salvo::{Listener, Router, Server};

pub async fn start(router: Router) -> anyhow::Result<()> {
    let c = conf::get().await;
    tracing::info!("log level: {}", c.server().log_level());
    let doc = OpenApi::new("salvo web api", "0.0.1").merge_router(&router);
    let router = router
        .unshift(doc.into_router("/api-doc/openapi.json"))
        .unshift(Scalar::new("/api-doc/openapi.json").into_router("scalar"))
        .unshift(SwaggerUi::new("/api-doc/openapi.json").into_router("swagger"));
    let local_addr = format!("0.0.0.0:{}", c.server().port());
    let acceptor = TcpListener::new(local_addr).bind().await;
    acceptor.holdings().iter().for_each(|h| {
        tracing::info!("📖 Open API Page With Scaler: https://{h}/scalar");
        tracing::info!("📖 Open API Page With SwaggerUi://{h}/swagger");
    });
    Server::new(acceptor).serve(router).await;
    Ok(())
}
