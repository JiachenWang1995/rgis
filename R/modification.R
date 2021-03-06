# Tools to modify raster or sf objects

#' Add and calculate an area field for polygon sf objects
#'
#' Add and calcualte an area field for polygon sf objects.  Area is calcuated
#' based on the linear unit of the assigned projection of the input sf object.
#'
#' @param sf_obj An polygon sf object
#' @param field_name character. The name of the area field.
#' @return Modified sf object
#' @author Chris R. Vernon (chris.vernon@pnnl.gov)
#' @importFrom sf st_area
#'
#' @export
add_area_field <- function(sf_obj, field_name) {
  
  sf_obj[field_name] <- st_area(sf_obj$geometry)
  
  return(sf_obj)
}


#' Fill holes in polygon by area threshold
#'
#' @param sf_object sf polygon object
#' @param sqkm_threshold area threshold to fill holes smaller than in square kilometers
#' @details Fill holes in polygon by area threshold in square kilometers
#' @importFrom units set_units
#' @importFrom smoothr fill_holes
#' @export
fill_polygon_holes <- function(sf_object, sqkm_threshold) {
  
  # set area threshold
  area_thresh <- set_units(sqkm_threshold, km^2)
  
  # remove holes
  return(fill_holes(sf_object, threshold = area_thresh))
}
