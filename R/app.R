library(ntpuecon110graduate)
dir.create("docs")
dir.create('temp')
page_index_vanilla() |> econIDV::showWidget()
page_index_vanilla() |> htmltools::save_html("temp/index.html")
page_form() |> econIDV::showWidget()
page_form() |> htmltools::save_html("temp/form.html")
page_index_vanilla() |>
  pwatest::create_pwa(publishingSite = "https://ntpuecon.github.io/NESH2022", icon512="/Users/martinl/Downloads/ntpuecon110graduate512.png") -> pwa
