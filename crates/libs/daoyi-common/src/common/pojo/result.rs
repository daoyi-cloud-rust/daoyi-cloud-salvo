//! 通用结果封装
//!
//! 对应 Java 的 CommonResult 类

use salvo::prelude::*;
use serde::{Deserialize, Serialize};

/// 通用返回结果
#[derive(Debug, Clone, Serialize, Deserialize, ToSchema)]
pub struct CommonResult<T> {
    /// 错误码 (0 表示成功)
    pub code: i32,

    /// 返回数据
    #[serde(skip_serializing_if = "Option::is_none")]
    pub data: Option<T>,

    /// 错误信息
    #[serde(skip_serializing_if = "Option::is_none")]
    pub msg: Option<String>,
}

impl<T> CommonResult<T> {
    /// 创建成功结果
    pub fn success(data: T) -> Self {
        Self {
            code: 0,
            data: Some(data),
            msg: None,
        }
    }

    /// 创建成功结果 (无数据)
    pub fn ok() -> CommonResult<()> {
        CommonResult {
            code: 0,
            data: Some(()),
            msg: None,
        }
    }

    /// 创建错误结果
    pub fn error(code: i32, msg: impl Into<String>) -> CommonResult<T> {
        CommonResult {
            code,
            data: None,
            msg: Some(msg.into()),
        }
    }

    /// 判断是否成功
    pub fn is_success(&self) -> bool {
        self.code == 0
    }
}

impl<T> From<T> for CommonResult<T> {
    fn from(data: T) -> Self {
        Self::success(data)
    }
}

// 实现 Salvo 的 Writer trait，使其可以直接作为响应返回
#[async_trait]
impl<T: Serialize + Send> Writer for CommonResult<T> {
    async fn write(mut self, _req: &mut Request, _depot: &mut Depot, res: &mut Response) {
        res.render(Json(self));
    }
}

// 实现 EndpointOutRegister trait，使其可以在 endpoint 中使用
impl<T: Serialize + Send + ToSchema + 'static> EndpointOutRegister for CommonResult<T> {
    fn register(_components: &mut salvo::oapi::Components, operation: &mut salvo::oapi::Operation) {
        operation
            .responses
            .insert("200", salvo::oapi::Response::new("Successful Response"));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_success() {
        let result = CommonResult::success("test data");
        assert!(result.is_success());
        assert_eq!(result.code, 0);
        assert_eq!(result.data, Some("test data"));
    }

    #[test]
    fn test_error() {
        let result = CommonResult::<()>::error(500, "error message");
        assert!(!result.is_success());
        assert_eq!(result.code, 500);
        assert_eq!(result.msg, Some("error message".to_string()));
    }
}
