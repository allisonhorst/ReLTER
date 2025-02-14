% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ilter_generalinfo.R
\name{get_ilter_generalinfo}
\alias{get_ilter_generalinfo}
\title{eLTER get_ilter_generalinfo function}
\usage{
get_ilter_generalinfo(country_name = NA, site_name = NA, show_map = FALSE)
}
\arguments{
\item{country_name}{A `character`. This character string filters
the full set of DEIMS sites by country name. Partial matching is supported.}

\item{site_name}{A `character`. This character string filters by site name
where, again, partial matching is supported}

\item{show_map}{A `boolean`. If TRUE a Leaflet map of site locations
is shown. Default FALSE}
}
\value{
An `sf` object of the bounding boxes of sites in the filtered list,
containing the name, DEIMS ID, longitude, latitude, average altitude,
and affiliation of the filtered ILTER sites.
If no bounding box is available,the centroid is returned.
}
\description{
This function downloads generic information
of all sites, or a subset of sites of ILTER, through the DEIMS-SDR
API. If no `country_name` or `site_name` are specified,
the whole list of sites is returned. If either or both of the filtering
strings is specified, then a filtered subset of the sites is acquired.
}
\examples{
\dontrun{
# list of the all sites info with ILTER
listOfAllSites <- get_ilter_generalinfo()
length(listOfAllSites[,1])

# example about country name parameter
sitesAustria <- get_ilter_generalinfo(country_name = "Austri")
# (matches Austria, but not Australia)
length(sitesAustria$title)

# example of single site in a country
eisenwurzen <- get_ilter_generalinfo(
  country_name = "Austri",
  site_name = "Eisen"
)
eisenwurzen[,1:2]
# extract DEIMS.Id
eisenwurzen_deimsid <- eisenwurzen$uri
eisenwurzen_deimsid

# example of single site in a country and return only map
get_ilter_generalinfo(
  country_name = "Italy",
  site_name = "Maggiore",
  show_map = TRUE
)
}
}
\author{
Alessandro Oggioni, phD (2021) \email{oggioni.a@irea.cnr.it}

Micha Silver, phD (2021) \email{silverm@post.bgu.ac.il}
}
