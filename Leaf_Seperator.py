#! /usr/bin/python -u

import sys
import numpy as np
import datetime
import glob
import os
import os.path
import shutil
import tlseparation as tls

#os.listdir("./temp")

def run_sep(path_to_unprocessed, path_to_completed, path_to_wood_structure):
    list_trees = glob.glob(path_to_unprocessed + '*.txt')

    for elem in list_trees:
        print elem
     
    for tree_file in list_trees:
        filename = os.path.basename(tree_file)
        print datetime.datetime.now(), "| opening file: ", tree_file
        tree = open(tree_file)
        print datetime.datetime.now(),  "| file opened, now loading it... ", filename
        arr = np.loadtxt(tree)
        print datetime.datetime.now(), "| file was loaded, now running Tlseperation... "
        try:
            wood, leaf = tls.scripts.generic_tree(arr[:, :3])
            #wood, leaf = tls.scripts.nopath_generic_tree(arr[:, :3])
            # change the call to leaf stripping function based on needs
            wood, not_wood = tls.scripts.isolated_clusters(wood)
            print datetime.datetime.now(), "| TLSeparation is complete, now saving it... "
            np.savetxt(path_to_wood_structure + filename[:-4] + '.wood.txt', wood)
            #np.savetxt(' ADD LOCAL DIRECTORY ' + filename[:-4] + '.leaves.txt', leaf)
            # ^^^ incase you want the leaf file too 
            print datetime.datetime.now(), "| saved " + filename[:-4] + ".wood.txt to directory"
            #if os.path.isfile()
            print 'Saved\n' 
            shutil.move(tree_file, path_to_completed)
        except:
            print("error on", filename)
    print datetime.datetime.now(), "| Everything DONE !!! "

if __name__ == "__main__":
    path_to_unprocessed = "./Full_Trees/" 
    path_to_completed = "./Full_Trees/completed/"
    path_to_wood_structure = "./Wood_structure_Trees"
    run_sep(path_to_unprocessed, path_to_completed, path_to_wood_structure)
