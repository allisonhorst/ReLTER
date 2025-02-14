% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_network_envcharacts.R
\name{get_network_envcharacts}
\alias{get_network_envcharacts}
\title{eLTER get_network_envcharacts function}
\usage{
get_network_envcharacts(networkDEIMSID)
}
\arguments{
\item{networkDEIMSID}{A `character`. DEIMS ID of network
from DEIMS-SDR website. More information about DEIMS ID refer to these pages:
\href{https://deims.org/docs/deimsid.html}{page}, and
\href{https://deims.org/search?f[0]=result_type:network}{page}
the complete list of ILTER networks.}
}
\value{
The output of the function is a `tibble` containing all the
Environmental Characteristics of the network's sites.
}
\description{
This function obtains several Envinronmental Characteristics:
title, URI, geocoordinates, country name, and elevation
of sites in an eLTER Network (e.g. Italy) through the DEIMS-SDR sites API.
}
\examples{
\dontrun{
listEnvCharacts <- get_network_envcharacts(
  networkDEIMSID =
  "https://deims.org/network/7fef6b73-e5cb-4cd2-b438-ed32eb1504b3"
)
listEnvCharacts[1:10, ]
}

}
\author{
Alessandro Oggioni, phD (2020) \email{oggioni.a@irea.cnr.it}
}
