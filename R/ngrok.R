apptest:::startAppTest()
app$meta$app_port
glue::glue("ngrok http {app$meta$app_port}") |> clipr::write_clip()
system2(glue::glue("ngrok http {app$meta$app_port}"))
