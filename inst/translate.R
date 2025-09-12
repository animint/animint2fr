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
## Country translation from World Bank data.
wb_url <- "https://api.worldbank.org/v2/%s/indicator/SP.POP.TOTL?downloadformat=csv"
dir.create("BanqueMondiale", showWarnings = FALSE)
for(lang in c("en","fr")){
  lang_url <- sprintf(wb_url, lang)
  lang.zip <- file.path("BanqueMondiale", paste0(lang, ".zip"))
  if(!file.exists(lang.zip)){
    download.file(lang_url, lang.zip)
    unzip(lang.zip, exdir="BanqueMondiale")
  }
}
library(data.table)
country_long <- nc::capture_first_glob(
  "BanqueMondiale/API*.csv",
  "_",
  lang="en|fr",
  READ=function(f)fread(f,header=TRUE))
country_wide <- dcast(
  country_long,
  `Country Code` ~ lang,
  value.var="Country Name")
en2fr <- c(
  country_wide[, structure(fr, names=en)],
  "Cape Verde"="Cap-Vert",
  "Czech Republic"="République tchèque",
  "Faeroe Islands"="Îles Féroé",
  "Korea, Dem. Rep."="Corée du Nord",
  "Macedonia, FYR"="Macédoine du Nord",
  "Puerto Rico"="Porto Rico",
  "Swaziland"="Eswatini",
  "Turkey"="Turquie",
  "Vietnam"="Vietnam")
BanqueMondiale$région <- factor(BanqueMondiale$Region, names(en2fr.region), en2fr.region)
BanqueMondiale$espérance.de.vie <- BanqueMondiale$life.expectancy
BanqueMondiale$taux.de.fertilité <- BanqueMondiale$fertility.rate
BanqueMondiale$année <- BanqueMondiale$year
BanqueMondiale$pays <- en2fr[BanqueMondiale$country]
unique(subset(BanqueMondiale, is.na(pays) & !is.na(country), select=c("pays","country")))
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
