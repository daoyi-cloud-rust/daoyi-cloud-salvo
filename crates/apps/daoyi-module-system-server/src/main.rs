use daoyi_starter_app::app;

mod controller;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    app::run(controller::create_router()).await
}
