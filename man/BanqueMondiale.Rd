\name{BanqueMondiale}
\alias{BanqueMondiale}
\docType{data}
\title{
  Données de la banque mondiale avec noms en français
}
\description{
  Une ligne pour chaque pays et année.
}
\usage{data("BanqueMondiale")}
\format{
  data frame avec 11342 lignes, une pour chaque combinaison de pays et
  année, pareil que \code{data(WorldBank,package="animint2")}, mais nous
  avons rajouter les colonnes suivantes.
  \describe{
    \item{\code{Region}}{comme \code{region}, mais sans parenthèses}
    \item{\code{région}}{traduction de \code{Region}}
    \item{\code{espérance.de.vie}}{copie de \code{life.expectancy}}
    \item{\code{taux.de.fertilité}}{copie de \code{fertility.rate}}
    \item{\code{année}}{copie de \code{year}}
    \item{\code{pays}}{copie de \code{country}}
    \item{\code{PIB.par.habitant.USD}}{copie de \code{GDP.per.capita.Current.USD}}
    \item{\code{alphabétisation}}{copie de \code{15.to.25.yr.female.literacy}}
    \item{\code{revenu}}{traduction de \code{income}}
  }
}
\source{
  data(WorldBank, package="animint2")
}
\keyword{datasets}
