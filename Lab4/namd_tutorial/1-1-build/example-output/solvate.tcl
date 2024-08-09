package require solvate
# loading the solvate package (included in the VMD software)

solvate myo.psf myo.pdb -t 5 -o myo_wb
# loading the psf and pdb files. The -t option creates the water box dimensions such that
# there is a layer of water 5Å in each direction from the atom with the largest
# coordinate in that direction. The -o option creates the output files ubq_wb.pdb
# and ubq_wb.psf for ubiquitin with the water box.

exit
