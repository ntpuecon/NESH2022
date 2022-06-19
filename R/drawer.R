drawer = function(topDrawerContent, bottomDrawerContent){
  dep=econWeb::Dependency()

".drawer {
  position: relative;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0px;
  gap: 5px;
}
.topdrawer {
  flex: none;
  order: 0;
  flex-grow: 0;
}
.bottomdrawer {
  flex: none;
  order: 1;
  flex-grow: 0;
}" -> .style
  tags$div(
    class="drawer",
    #style = css("position"="relative",width="100%", height),
    tags$div(class = "topdrawer",
      style = css(position="absolute", bottom="0px"), topDrawerContent),
    tags$div(class = "bottomdrawer",
      style = css(position="absolute", bottom="0px"), bottomDrawerContent))|>
  tagList(
    dep$all(),
    drawerDep(),
    tags$style(
      .style)

    )}
drawerDep = function(){
  htmltools::htmlDependency(
    name="drawer", version="1.0",
    src=c(file=system.file("app",package = "NESH2022")),
    script="js/drawer2.js"
  )
}
drawerContainer = function(...){

".drawer-container {
  /* Auto layout */

    display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-end;
  padding: 57px 34px;
  gap: 30px;

  position: relative;
}
.drawer {
  flex: none;
  flex-grow: 0;
}" -> .style
  require(htmltools)
tagList(
  tags$style(.style),
  div(
    class="drawer-container", ...
  )
)

}
demo_drawer = function(){
  require(htmltools)
  tagList(
    tags$style('

'),
    tags$div(class = "sizecontainer-sizeadjustment",
      style = NA,
      tags$div(class = "sizecontainer-sizeadjustment-plus",
        tags$i(class = "material-icons",
          "add")),
      tags$div(class = "sizecontainer-sizeadjustment-reset",
        tags$i(class = "material-icons",
          "center_focus_strong")),
      tags$div(class = "sizecontainer-sizeadjustment-reset",
        id = "globeopaque",
        tags$i(class = "material-icons",
          style = "opacity:0.4;",
          "public")),
      tags$div(class = "sizecontainer-sizeadjustment-minus",
        tags$i(class = "material-icons",
          "remove")))
  ) -> topdrawer

  bottomdrawer=tags$i(class = "material-icons","public")
  drawer(topDrawerContent = topdrawer, bottomDrawerContent = bottomdrawer) -> dw1

  ## drawer 2
  topd2 = {tags$div(class = "speedcontainer-speedadjustment",
    tags$div(class = "speedcontainer-speedadjustment-plus",
      tags$i(class = "material-icons",
        "add")),
    tags$div(class = "speedcontainer-speedadjustment-minus",
      tags$i(class = "material-icons",
        "remove")))}
  btmd2 = tags$i(class = "material-icons",
    "speed")
  drawer(topd2, btmd2) -> dw2

  drawerContainer(dw1, dw2) |> app$test()
  # div(div(
  #   style="display:inline-block;width: 40px;height: 200px;", dw1
  # ),
  # div(
  #   style="display:inline-block;width: 40px;height: 200px;", dw2
  # )
  # ) |> app$test()
}

