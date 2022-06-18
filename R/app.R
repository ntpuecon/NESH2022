library(ntpuecon110graduate)
dir.create("docs")
dir.create('temp')
page_index_vanilla() |> econIDV::showWidget()
page_index_vanilla() |> htmltools::save_html("temp/index.html")
page_form() |> econIDV::showWidget()
page_form() |> htmltools::save_html("temp/form.html")
page_index_vanilla() |>
  pwatest::create_pwa(publishingSite = "https://ntpuecon.github.io/NESH2022", icon512="/Users/martinl/Downloads/ntpuecon110graduate512.png") -> pwa
pwa$webmanifestJson$name="Ntpu Economic wiSH 2022"
pwa$webmanifestJson$short_name="NESH2022"
pwa$webmanifestJson$description="Ntpu Economic wiSH（簡稱NESH）是給國立臺北大學學士班及進修學士班互留祝福的App，每一則祝福種出一顆綠樹。點擊樹可叫出種樹的祝福卡，雙擊卡片可叫出所種下的樹。畢業後同學也可透過此App，更新自己的訊息，讓彼此知道自己的近況。"
pwa$updateManifest()
servr::httd("docs")
