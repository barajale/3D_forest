# 3D_forest

Creating QSM Models in completed in two parts; Stripping Leafs and Creating QSM Models

This process produced accurate QSM model of Coastal Red Woods compared to known good AGB measurements. Not yet understood if this process works for other tree species.



Required Programs: 
	- Matlab
	- Python
	- Anaconda (command line) https://docs.anaconda.com/anaconda/install/index.html




*** Running Leaf Seperator ***

	Activate / Setup Conda Enviroment

	 	Activate conda enviroment:  conda activate leaf-Envi

	 	If your conda enviroment has not already been initalized use the following commmand: conda env create --file bio-env.txt
	 	This will only work for osx-64 architure. If you are using a different operating systems use the package-list.txt file to install the packages


	 	Setting up the envoirment to work properly is challenging and tricky
	 	When installing packages try to only use: conda install [package name]
	 	some packages were not avaible throught the conda installer so instead you may need to use pip install [package name] for some packages but try to avoid

	 	tip:
	 	from the command line you can check if the tlseperation module or any other module is install correctly by lauching an inline pythoin shell with the following command: python2.7 
		Then check for the module with this command: import tlseparation
		No errors means it's properly installed





	Run Seperation

		python2.7 Leaf_Seperator.py

		Errors could be a result from a package being installed incorrectly. Try the trouble shooting tip in section above. 

		An Error can also occur in the leaf seperation process. You can attempt to use a different seperation function by uncommenting the following line. make sure to comment out the line above

			wood, leaf = tls.scripts.nopath_generic_tree(arr[:, :3])

	Sort by Height

		No good way of sorting unless you have an excel sheet. 


*** Running QSM Modeling ***


	based on which tree height class your processing. You'll need to adjust the create_input.m file in /TreeQSM-master/src/

	Suggested inputs parameters for create_input.m

		Small - 2 - 10 meters
			inputs.PatchDiam1 = [0.020 .03];
			inputs.PatchDiam2Min = [0.0030 .0060 .0090 .012];
			inputs.PatchDiam2Max = [0.0150 .020 .025];
			inputs.BallRad1 = inputs.PatchDiam1+0.007; 
			inputs.BallRad2 = inputs.PatchDiam2Max+0.003;
			
		Med - 10 - 25 meters
			inputs.PatchDiam1 = [0.045 .08];
			inputs.PatchDiam2Min = [0.0080 .0130 .0180 .023];
			inputs.PatchDiam2Max = [0.010 .0150 .02];
			inputs.BallRad1 = inputs.PatchDiam1+0.02; 
			inputs.BallRad2 = inputs.PatchDiam2Max+0.01;
			
		Biggest 25 - 40+ meters
			inputs.PatchDiam1 = [0.090 .11];
			inputs.PatchDiam2Min = [0.0110 0.0160 0.0210 0.026];
			inputs.PatchDiam2Max = [0.013 .0180 .05];
			inputs.BallRad1 = inputs.PatchDiam1+0.04; 
			inputs.BallRad2 = inputs.PatchDiam2Max+0.02;

	 When processing many trees I suggest launching Matlab on the commmandline. Seemed to be more reliable. 

	  




