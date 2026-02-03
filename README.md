# Golden Image Generator (GIG)

GIG is a Packer enabled Virtual Machine image generator for Crane-OSS.
It's purpose is to store the image all newly provisioned Crane hosts should have. Most importantly it will create a VM that already
contains subd - which is the program that would then communicate with Crane in order to inform it of any issues with the Host.