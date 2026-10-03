use axum::Router;

mod healthcheck;

pub fn app() -> Router {
    Router::new().nest("/healthcheck", healthcheck::register())
}
