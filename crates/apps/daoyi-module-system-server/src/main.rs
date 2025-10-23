use salvo::prelude::*;

mod controller;

#[tokio::main]
async fn main() {
    let router = controller::create_router();
    let doc = OpenApi::new("salvo web api", "0.0.1").merge_router(&router);
    let router = router
        .unshift(doc.into_router("/api-doc/openapi.json"))
        .unshift(Scalar::new("/api-doc/openapi.json").into_router("scalar"))
        .unshift(SwaggerUi::new("/api-doc/openapi.json").into_router("swagger"));
    let acceptor = TcpListener::new("0.0.0.0:5800").bind().await;
    Server::new(acceptor).serve(router).await;
}
