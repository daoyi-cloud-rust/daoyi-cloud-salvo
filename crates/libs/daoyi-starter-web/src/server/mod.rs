use crate::hoops::{cors, errors};
use daoyi_common::common::conf;
use salvo::conn::{Acceptor, TcpListener};
use salvo::oapi::OpenApi;
use salvo::prelude::*;
use salvo::server::ServerHandle;
use salvo::{Listener, Router, Server};
use tokio::signal;

pub async fn start(router: Router) -> anyhow::Result<()> {
    let router = Router::new()
        .hoop(Logger::new())
        .hoop(cors::cors_hoop())
        .push(router);
    let c = conf::get().await;
    tracing::info!("log level: {}", c.server().log_level());
    let doc = OpenApi::new("Daoyi Cloud with Salvo web api", "0.0.1").merge_router(&router);
    let router = router
        .unshift(doc.into_router("/api-doc/openapi.json"))
        .unshift(Scalar::new("/api-doc/openapi.json").into_router("scalar"))
        .unshift(SwaggerUi::new("/api-doc/openapi.json").into_router("swagger"));
    let local_addr = format!("0.0.0.0:{}", c.server().port());
    let acceptor = TcpListener::new(local_addr).bind().await;
    acceptor.holdings().iter().for_each(|h| {
        tracing::info!("📖 Open API Page With Scaler {}/scalar", h);
        tracing::info!("📖 Open API Page With SwaggerUi {}/swagger", h);
    });
    let service = Service::new(router);
    let server = Server::new(acceptor);
    tokio::spawn(shutdown_signal(server.handle()));
    server.serve(service).await;
    Ok(())
}

async fn shutdown_signal(handle: ServerHandle) {
    let ctrl_c = async {
        signal::ctrl_c()
            .await
            .expect("failed to install Ctrl+C handler");
    };

    #[cfg(unix)]
    let terminate = async {
        signal::unix::signal(signal::unix::SignalKind::terminate())
            .expect("failed to install signal handler")
            .recv()
            .await;
    };

    #[cfg(not(unix))]
    let terminate = std::future::pending::<()>();

    tokio::select! {
        _ = ctrl_c => tracing::info!("ctrl_c signal received"),
        _ = terminate => tracing::info!("terminate signal received"),
    }
    handle.stop_graceful(std::time::Duration::from_secs(60));
}
