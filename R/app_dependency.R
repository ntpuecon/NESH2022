attachAppDep = function(tag) {
tagList(
  tag,
  htmltools::htmlDependency(
  name = "app",
  version = "1.0",
  src = c(file = system.file("app", package="NESH2022" )),
  script = "js/appScript.js",
  stylesheet = "css/appStyle.css")
)
}
