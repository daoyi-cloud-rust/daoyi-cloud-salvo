# daoyi-cloud-salvo

RuoYi-Vue 全新 Rust 版本

- 模块
  - 生成 system entity
  ```shell
    sea-orm-cli generate entity -s system --with-serde both --model-extra-attributes 'serde(rename_all="camelCase")' --date-time-crate chrono -o ./crates/apis/daoyi-module-system-api/src/system/entities
  ```
  - 生成 infra entity
  ```shell
    sea-orm-cli generate entity -s infra --with-serde both --model-extra-attributes 'serde(rename_all="camelCase")' --date-time-crate chrono -o ./crates/apis/daoyi-module-infra-api/src/infra/entities
  ```