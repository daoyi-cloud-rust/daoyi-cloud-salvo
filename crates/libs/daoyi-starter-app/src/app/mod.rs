use daoyi_common::common::{conf, logger, utils};
use daoyi_starter_mybatis::database;
use daoyi_starter_redis::redis_util;
use daoyi_starter_web::server;
use salvo::Router;

pub async fn run(router: Router) -> anyhow::Result<()> {
    logger::init();
    tracing::info!("Starting app server...");
    utils::id::init()?;
    conf::refresh().await?;
    redis_util::init_redis().await?;
    database::init_db().await?;
    server::start(router).await
}
