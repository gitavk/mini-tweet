use axum::Router;
use axum::routing::get;

pub fn app() -> Router {
    Router::new().route("/", get(async || "Hello, World!"))
}
