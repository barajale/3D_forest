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

def run_sep(path_to_unprocessed, done, out):
    list_trees = glob.glob(path_to_unprocessed + '*.txt')

    for elem in list_trees:
        print elem
    
    count = 0 
    for tree_file in list_trees:
        filename = os.path.basename(tree_file)
        #print datetime.datetime.now(), "| opening file: ", tree_file
        tree = open(tree_file)
        print datetime.datetime.now(),  "| file opened, now loading it... ", filename
        arr = np.loadtxt(tree)
        print datetime.datetime.now(), "| file was loaded, now running Tlseperation... "
        wood, leaf = tls.scripts.generic_tree(arr[:, :3])
        wood, not_wood = tls.scripts.isolated_clusters(wood)
        print datetime.datetime.now(), "| TLSeparation is complete, now saving it... "
        np.savetxt(out + filename[:-4] + '.wood.txt', wood)
        #np.savetxt('./post_processed/leaves_structure/' + filename[:-4] + '.leaves.txt', leaf)
        print datetime.datetime.now(), "| saved " + filename[:-4] + ".wood.txt to directory"
        #if os.path.isfile()
        print 'Saved\n' 
        shutil.move(tree_file, done)
    print datetime.datetime.now(), "| Everything DONE !!! "

if __name__ == "__main__":
    path_to_unprocessed = raw_input("path to unprocessed trees please /path/ : ")
    done = raw_input("path to completed tree folder /path/ : ")
    out = raw_input("path to out file /path/: ")
    print path_to_unprocessed
    run_sep(path_to_unprocessed, done, out)
