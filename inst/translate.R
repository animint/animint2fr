data(WorldBank, package="animint2")
BanqueMondiale <- WorldBank
BanqueMondiale$Region <- sub(" \\(.*", "", BanqueMondiale$region)
en2fr.region <- c(
  "East Asia & Pacific"="Asie de l'Est et Pacifique",
  "Europe & Central Asia"="Europe et Asie centrale",
  "Latin America & Caribbean"="Amérique latine et Caraïbes",
  "Middle East & North Africa"="Moyen-Orient et Afrique du Nord",
  "North America"="Amérique du Nord",
  "South Asia"="Asie du Sud",
  "Sub-Saharan Africa"="Afrique subsaharienne")
BanqueMondiale$région <- factor(BanqueMondiale$Region, names(en2fr.region), en2fr.region)
BanqueMondiale$espérance.de.vie <- BanqueMondiale$life.expectancy
BanqueMondiale$taux.de.fertilité <- BanqueMondiale$fertility.rate
BanqueMondiale$année <- BanqueMondiale$year
BanqueMondiale$pays <- BanqueMondiale$country
BanqueMondiale$PIB.par.habitant.USD <- BanqueMondiale$GDP.per.capita.Current.USD
BanqueMondiale$alphabétisation <- BanqueMondiale[["15.to.25.yr.female.literacy"]]
dput(levels(BanqueMondiale$income))
en2fr.income <- c(
  "High income: OECD"="Revenu élevé : OCDE",
  "High income: nonOECD"="Revenu élevé : nonOCDE",
  "Upper middle income"="Revenu moyen élevé",
  "Lower middle income"="Revenu moyen bas",
  "Low income"="Revenu bas",
  "Not classified"="Pas classé")
BanqueMondiale$revenu <- factor(BanqueMondiale$income, names(en2fr.income), en2fr.income)
save(BanqueMondiale, file="../data/BanqueMondiale.RData", compress="xz")
if(FALSE){
  prompt(BanqueMondiale, "../man/BanqueMondiale.Rd")
}
names(BanqueMondiale)
