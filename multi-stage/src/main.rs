use actix_web::{App, get, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok().body("<h1><a href='https://docs.docker.com/build/building/multi-stage'>Multi-stage builds</a></h1>")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Server started at port: http://localhost");
    HttpServer::new(|| { App::new().service(index) })
        .bind(("0.0.0.0", 80))?
        .run()
        .await
}