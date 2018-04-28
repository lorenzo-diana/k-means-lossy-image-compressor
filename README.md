# k-means lossy image compressor
Simple script that uses the K-means algorithm to find n colours to use to represent an image.
Each pixel of the input image is interpreted as a point in a tri-dimensional space (Red, Green, Blue). The K-means algorithm is used to find n cluster, which input pixels are assigned, then each pixel colour is replaced by the colour corresponding the the center of the cluster to which the pixel belongs.
Functions to save to (and read from) file the resulting compressed image are provided. (not optimized!)
