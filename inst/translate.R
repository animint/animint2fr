data(WorldBank, package="animint2")
WorldBank$espérance.de.vie <- WorldBank$life.expectancy
WorldBank$taux.de.fertilité <- WorldBank$fertility.rate
en2fr.region <- c(
  "East Asia & Pacific"="Asie de l'est et pacifique",
  "Europe & Central Asia"="Europe et Asie centrale",
  "Latin America & Caribbean"="Amérique latine et Caraïbes",
  "Middle East & North Africa"="Moyen orient et Magreb",
  "North America"="Amérique du nord",
  "South Asia"="Asie du sud",
  "Sub-Saharan Africa"="Afrique subsaharienne")
WorldBank$Region <- sub(" \\(.*", "", WorldBank$region)
WorldBank$région <- factor(WorldBank$Region, names(en2fr.region), en2fr.region)
WorldBank$année <- WorldBank$year
WorldBank$pays <- WorldBank$country
BanqueMondiale <- WorldBank
save(BanqueMondiale, file="../data/BanqueMondiale.RData", compress="xz")
if(FALSE){
  prompt(BanqueMondiale, "../man/BanqueMondiale.Rd")
}
