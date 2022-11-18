apptest:::startAppTest()
app$meta$app_port
glue::glue("ngrok http {app$meta$app_port}") |> clipr::write_clip()
glue::glue("ngrok http {app$meta$app_port} | tee ngrok.txt")
rstudioapi::terminalExecute(glue::glue("ngrok http {app$meta$app_port} | tee ngrok.txt"))

start_ngrok = function(){
  rstudioapi::terminalExecute(glue::glue("ngrok http {app$meta$app_port}")) -> tId

  rstudioapi::terminalActivate(tId, show = T)
}

rstudioapi::terminalExecute(glue::glue("ngrok http {app$meta$app_port}")) -> tId
xfun::read_utf8("ngrok.txt") -> .lines
rstudioapi::terminalBuffer(tId, F)
rstudioapi::terminalActivate(tId, show = T)
rstudioapi::terminalContext(tId) -> contxt
contxt$lines
contxt |> View()
rstudioapi::term
