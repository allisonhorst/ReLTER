% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_site_ODS.R
\name{get_site_ODS}
\alias{get_site_ODS}
\title{eLTER get_site_ODS function}
\usage{
get_site_ODS(deimsid, dataset = "landcover")
}
\arguments{
\item{deimsid}{a `character`. The DEIMS ID of the site from
DEIMS-SDR website. More information about DEIMS ID from:
\href{https://deims.org/docs/deimsid.html}{page}.}

\item{dataset}{a `character`. The requested dataset. One of:
"landcover", "clc2018", "osm_buildings", "natura2000",
"ndvi_spring", "ndvi_summer", "ndvi_autumn", "ndvi_winter".
Default is "landcover".}
}
\value{
The function returns a SpatRaster object (from the `terra` package)
of the requested dataset, cropped to the site boundaries
The user should save the raster to disk, if necessary.
i.e. writeRaster(ds_site, "site_dataset.tif")
}
\description{
This function acquires various raster layers from
ODS Europe:  https://maps.opendatascience.eu/
and crops to an eLTER site boundary, which is obtained
from the DEIMS-SDR sites API.
}
\details{
Supported datasets from the ODS repository include:
Landcover: Land-cover class according to the highest probability,
   generated by a spatiotemporal ensemble-ML model. 30 m. resolution
CLC2018: Corine land cover rasterized to 100m spatial resolution
   and provided by Copernicus Land Monitoring Service.
OSM buildings: Buildings according to OSM polygons
   and the Copernicus impervious build-up layer (2018),
   aggregated and rasterized first to 10m spatial resolution
   and after downsampled to 30m by spatial average.
Natura2000: Protected areas rasterized from NATURA 2000
   (A, B and C site categories)
   and OSM (IUCN Ia, IUCN Ib, IUCN 2, IUCN 3, IUCN 4, IUCN 5, IUCN 6
   and others categories),
   first to 10m spatial resolution and after downsampled
   to 30m by spatial average.
   The overlap areas are indicated in a new category.

NDVI:  NDVI time-series,
   derived from the Landsat quarterly temporal composites

All datasets are georeferenced to the
EPSG:3035 coordinate reference system.
and all except clc2018 have 30 meters resolution
}
\examples{
 \dontrun{
# Landcover for Angelo Mosso
siteLandcover <- get_site_ODS(
  deimsid = "https://deims.org/17210eba-d832-4759-89fa-9ff127cbdf6e",
  dataset = "landcover"
)
siteLandcover
terra::plot(siteLandcover)

# NDVI for Eisenwurzen
siteNDVI <- get_site_ODS(
  deimsid = "https://deims.org/d0a8da18-0881-4ebe-bccf-bc4cb4e25701",
  dataset = "ndvi_summer"
)
siteNDVI
terra::plot(siteNDVI)
}

}
\author{
Micha Silver, phD (2020) \email{silverm@post.bgu.ac.il}

Alessandro Oggioni, phD (2020) \email{oggioni.a@irea.cnr.it}
}
