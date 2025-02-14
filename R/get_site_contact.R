#' @title eLTER get_site_contact function
#' @description This function obtains the contact information for an
#' eLTER site through the DEIMS-SDR sites API.
#' @param deimsid A `character`. It is the DEIMS ID of the site from
#' DEIMS-SDR website. More information about DEIMS ID from:
#' \href{https://deims.org/docs/deimsid.html}{page}.
#' @return The output of the function is a `tibble` with main features of the
#' site and the contact information, such as: site manager, operation
#' organization, metadata provider, founding agency and site url.
#' @author Alessandro Oggioni, phD (2020) \email{oggioni.a@@irea.cnr.it}
#' @importFrom httr RETRY content
#' @importFrom utils capture.output
#' @importFrom dplyr as_tibble
#' @keywords internal
#'
### function get_site_contact
get_site_contact <- function(deimsid) {
  q <- '{title: .title,
       uri: "\\(.id.prefix)\\(.id.suffix)",
       geoCoord: .attributes.geographic.coordinates,
       country: .attributes.geographic.country,
       geoElev: .attributes.geographic.elevation,
       generalInfo: .attributes.contact
      }'
  jj <- get_id(deimsid, "sites")
  if (is.na(attr(jj, "status"))) {
    invisible(
      utils::capture.output(
        contact <- dplyr::as_tibble(
          do_Q(q, jj)
        )
      )
    )
  } else {
    message("\n----\nThe requested page could not be found.
Please check again the DEIMS.iD\n----\n")
    contact <- NULL
  }
  contact
}
