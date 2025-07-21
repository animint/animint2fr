\name{BanqueMondiale}
\alias{BanqueMondiale}
\docType{data}
\title{
  Données de la banque mondiale
}
\description{
  Une ligne pour chaque pays et année.
}
\usage{data("BanqueMondiale")}
\format{
  data frame avec 11342 lignes et 19 variables.
  \describe{
    \item{\code{Region}}{comme \code{region}, mais sans parenthèses}
    \item{\code{région}}{traduction de \code{Region}}
    \item{\code{espérance.de.vie}}{copie de \code{life.expectancy}}
    \item{\code{taux.de.fertilité}}{copie de \code{fertility.rate}}
    \item{\code{année}}{copie de \code{year}}
  }
}
\source{
  data(WorldBank, package="animint2")
}
\keyword{datasets}
