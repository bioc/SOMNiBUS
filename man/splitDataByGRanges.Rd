% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{splitDataByGRanges}
\alias{splitDataByGRanges}
\title{Split methylation data into regions based on the genomic annotations}
\usage{
splitDataByGRanges(
  dat,
  chr,
  annots,
  gap = -1,
  min.cpgs = 50,
  max.cpgs = 2000,
  verbose = TRUE
)
}
\arguments{
\item{dat}{a data frame with rows as individual CpGs appearing
in all the samples. The first 4 columns should contain the information of
\code{Meth_Counts} (methylated counts), \code{Total_Counts} (read depths),
\code{Position} (Genomic position for the CpG site) and \code{ID} (sample ID).
The covariate information, such as disease status
or cell type composition, are listed in column 5 and onwards.}

\item{chr}{character vector containing the chromosome information. Its length
should be equal to the number of rows in \code{dat}.}

\item{annots}{GenomicRanges object containing the annotations}

\item{gap}{integer defining the maximum gap that is allowed between
two regions to be considered as overlapping.
According to the \code{GenomicRanges::findOverlaps} function,
the gap between 2 ranges is the number of positions that separate them.
The gap between 2 adjacent ranges is 0. By convention when one range has
its start or end strictly inside the other (i.e. non-disjoint ranges),
the gap is considered to be -1.
Decimal values will be rounded to the nearest integer.
The default value is \code{-1} (meaning strict overlaping).}

\item{min.cpgs}{positive integer defining the minimum number of
CpGs within a region for the algorithm to perform optimally.
The default value is 50.}

\item{max.cpgs}{positive integer defining the maximum number of
CpGs within a region for the algorithm to perform optimally.
The default value is 2000.}

\item{verbose}{logical indicates if the algorithm should provide progress
report information.
The default value is TRUE.}
}
\value{
A named \code{list} of \code{data.frame} containing the data of each
independent region.
}
\description{
This function splits the methylation data into regions
based on the genomic annotations provided under the form of a GenomicRanges
object.
}
\examples{
#------------------------------------------------------------#
data(RAdat)
RAdat.f <- na.omit(RAdat[RAdat$Total_Counts != 0, ])
annot <- GenomicRanges::GRanges(seqnames = "chr1", IRanges::IRanges(
start = c(102711720,102711844,102712006,102712503,102712702), 
end = c(102711757,102711909,102712195,102712637,102712712)
))
results <- splitDataByGRanges(dat = RAdat.f, 
chr = rep(x = "chr1", times = nrow(RAdat.f)), 
annots = annot, gap = -1, min.cpgs = 5)
}
\author{
Audrey Lemaçon
}
