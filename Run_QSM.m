addpath(genpath('./TreeQSM-master/src/'));
savepath();

disp('Script Starting');

pth = './Wood_Structure_Trees/height_1/';
% alter the path location above ^^^ 
liste = dir(strcat(pth,'*.txt'));
files = {liste.name};
for k=1:length(files)
    disp('Processing:');
    disp(files{k});
    file = strcat(pth,files{k});
    pc_data = importdata(file);
    F = cubical_down_sampling(pc_data, 0.01);
    P = pc_data(F, :);
    P = P-mean(P);
    save('ignore_test', 'P');
    create_input;
    QSMs = make_models_parallel('ignore_test', 'QSMs_test', 10, inputs);
    [ TreeData , OptModels , OptInputs , OptQSM ] = select_optimum(QSMs, 'cyl_vol_dia10_mean');
    QSMs2 = make_models_parallel( 'ignore_test' , 'QSMs test2' , 25, OptInputs );
    [ TreeData , OptQSMs , OptQSM ] = estimate_precision( QSMs , QSMs2 , OptModels );
    %c = datetime;
    %datestr = strcat(extractAfter(string(c.Year),2), strcat('0',string(c.Month)), string(c.Day));
    newStr = extractBefore(files{k}, (length(files{k}) - 14));
    %save_model_text(OptQSM, newStr);
    %final = strcat('./QSM_Models/', newStr, datestr, '.mat');
    final = strcat('./QSM_Models/', newStr, '.mat');
    movefile(file, "Wood_structure_Trees/completed/")
    disp(final);
    save(final, 'OptQSM');
    %plot_cylinder_model(OptQSM.cylinder,1,4,1);
end
