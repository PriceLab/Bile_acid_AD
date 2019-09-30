%Code for generating context-specific metabolic networks

model = readCbModel('TC_model_final.mat'); %The model in xml format can also be loaded
load('expressionData_TC.mat');
changeCobraSolver('gurobi', 'LP');
changeCobraSolver('gurobi', 'MILP');
objective = {'CAATPS', 'EX_gln_L[e]', 'EX_glu_L[e]', 'biomass_maintenance'}'
model = changeObjective(model, objective)

tol = 1e-6;
core = {'CAATPS', 'EX_gln_L[e]', 'EX_glu_L[e]', 'biomass_maintenance','r1112', 'r1098'}';

exRxns = strmatch('EX_', model.rxns);
exRxns_names = model.rxns(exRxns);
model = changeRxnBounds(model,exRxns_names,0,'l');

model = changeRxnBounds(model,'EX_gln_L[e]',-0.013,'l');
model = changeRxnBounds(model,'EX_gln_L[e]',0.025,'u');
model = changeRxnBounds(model,'EX_acac[e]',-0.012,'l');
model = changeRxnBounds(model,'EX_acac[e]',-0.0015,'u');
model = changeRxnBounds(model,'r1391',-100,'l');
model = changeRxnBounds(model,'r1391',0,'u');
model = changeRxnBounds(model,'r1392',-100,'l');
model = changeRxnBounds(model,'r1392',0,'u');
model = changeRxnBounds(model,'HMR_0482',-100,'l');
model = changeRxnBounds(model,'HMR_0482',0,'u');
model = changeRxnBounds(model,'EX_h2o2[e]',-100,'l');
model = changeRxnBounds(model,'EX_h2o2[e]',0,'u');
model = changeRxnBounds(model,'EX_hco3[e]',-100,'l');
model = changeRxnBounds(model,'EX_hco3[e]',0,'u');
model = changeRxnBounds(model,'EX_lac_L[e]',-0.0058,'l');
model = changeRxnBounds(model,'EX_lac_L[e]',0.079,'u');
model = changeRxnBounds(model,'EX_adrnl[e]',0,'l');
model = changeRxnBounds(model,'EX_adrnl[e]',0,'u');
model = changeRxnBounds(model,'EX_dopa[e]',0,'l');
model = changeRxnBounds(model,'EX_dopa[e]',0,'u');
model = changeRxnBounds(model,'EX_nrpphr[e]',0,'l');
model = changeRxnBounds(model,'EX_nrpphr[e]',0,'u');
model = changeRxnBounds(model,'EX_ile_L[e]',-0.0041,'l');
model = changeRxnBounds(model,'EX_ile_L[e]',0.0004,'u');
model = changeRxnBounds(model,'EX_hxan[e]',-0.00045,'l');
model = changeRxnBounds(model,'EX_hxan[e]',0.00045,'u');
model = changeRxnBounds(model,'EX_ins[e]',-0.00045,'l');
model = changeRxnBounds(model,'EX_ins[e]',0.00045,'u');
model = changeRxnBounds(model,'EX_ser_L[e]',-0.011,'l');
model = changeRxnBounds(model,'EX_ser_L[e]',0.0016,'u');
model = changeRxnBounds(model,'EX_val_L[e]',-0.011,'l');
model = changeRxnBounds(model,'EX_val_L[e]',0.005,'u');
model = changeRxnBounds(model,'EX_asn_L[e]',-0.0009,'l');
model = changeRxnBounds(model,'EX_asn_L[e]',0.0037,'u');
model = changeRxnBounds(model,'EX_pro_L[e]',-0.0079,'l');
model = changeRxnBounds(model,'EX_pro_L[e]',0.0066,'u');
model = changeRxnBounds(model,'EX_pyr[e]',-0.0058,'l');
model = changeRxnBounds(model,'EX_pyr[e]',0.007,'u');
model = changeRxnBounds(model,'EX_ala_L[e]',-100,'l');
model = changeRxnBounds(model,'EX_ala_L[e]',0.0079,'u');
model = changeRxnBounds(model,'EX_gly[e]',-0.0053,'l');
model = changeRxnBounds(model,'EX_gly[e]',0.0086,'u');
model = changeRxnBounds(model,'EX_lys_L[e]',-0.0005,'l');
model = changeRxnBounds(model,'EX_lys_L[e]',0.011,'u');
model = changeRxnBounds(model,'EX_glu_L[e]',-0.0044,'l');
model = changeRxnBounds(model,'EX_glu_L[e]',0.0047,'u');
model = changeRxnBounds(model,'EX_glc_D[e]',-0.29,'l');
model = changeRxnBounds(model,'EX_glc_D[e]',-0.196,'u');
model = changeRxnBounds(model,'EX_phe_L[e]',0,'l');
model = changeRxnBounds(model,'EX_phe_L[e]',100,'u');
model = changeRxnBounds(model,'EX_trp_L[e]',0,'l');
model = changeRxnBounds(model,'EX_trp_L[e]',100,'u');
model = changeRxnBounds(model,'GLCt1r',-0.19,'l');
model = changeRxnBounds(model,'GLCt1r',-0.16,'u');
model = changeRxnBounds(model,'EX_thr_L[e]',0,'l');
model = changeRxnBounds(model,'EX_thr_L[e]',0.0008,'u');
model = changeRxnBounds(model,'EX_met_L[e]',0,'l');
model = changeRxnBounds(model,'EX_met_L[e]',0.0017,'u');
model = changeRxnBounds(model,'EX_tyr_L[e]',0,'l');
model = changeRxnBounds(model,'EX_tyr_L[e]',0.0017,'u');
model = changeRxnBounds(model,'EX_arg_L[e]',-0.004,'l');
model = changeRxnBounds(model,'EX_arg_L[e]',0,'u');
model = changeRxnBounds(model,'EX_his_L[e]',0,'l');
model = changeRxnBounds(model,'EX_his_L[e]',0.0025,'u');
model = changeRxnBounds(model,'EX_orn[e]',-0.0048,'l');
model = changeRxnBounds(model,'EX_orn[e]',0.0041,'u');
model = changeRxnBounds(model,'EX_Lcystin[e]',0,'l');
model = changeRxnBounds(model,'EX_Lcystin[e]',0.0045,'u');
model = changeRxnBounds(model,'EX_leu_L[e]',-0.0062,'l');
model = changeRxnBounds(model,'EX_leu_L[e]',0.0011,'u');
model = changeRxnBounds(model,'EX_o2[e]',-2.256,'l');
model = changeRxnBounds(model,'EX_o2[e]',-1.351,'u');
model = changeRxnBounds(model,'EX_co2[e]',0.515,'l');
model = changeRxnBounds(model,'EX_co2[e]',0.530,'u');
model = changeRxnBounds(model,'EX_3aib[e]',-0.00023,'l');
model = changeRxnBounds(model,'EX_co2[e]',1000,'u');
model = changeRxnBounds(model,'EX_4abut[e]',-0.0018,'l');
model = changeRxnBounds(model,'EX_4abut[e]',0,'u');
model = changeRxnBounds(model,'EX_ac[e]',-0.0013,'l');
model = changeRxnBounds(model,'EX_ac[e]',1000,'u');
model = changeRxnBounds(model,'EX_acald[e]',-0.0014,'l');
model = changeRxnBounds(model,'EX_acald[e]',1000,'u');
model = changeRxnBounds(model,'EX_ala_B[e]',-1000,'l');
model = changeRxnBounds(model,'EX_ala_B[e]',1000,'u');
model = changeRxnBounds(model,'EX_bhb[e]',-0.016,'l');
model = changeRxnBounds(model,'EX_bhb[e]',-0.001,'u');
model = changeRxnBounds(model,'EX_btn[e]',-1000,'l');
model = changeRxnBounds(model,'EX_btn[e]',1000,'u');
model = changeRxnBounds(model,'EX_crn[e]',-1000,'l');
model = changeRxnBounds(model,'EX_crn[e]',1000,'u');
model = changeRxnBounds(model,'EX_cys_L[e]',-0.0086,'l');
model = changeRxnBounds(model,'EX_cys_L[e]',0.0033,'u');
model = changeRxnBounds(model,'EX_duri[e]',1000,'u');
model = changeRxnBounds(model,'EX_duri[e]',-1000,'l');
model = changeRxnBounds(model,'EX_etoh[e]',0,'l');
model = changeRxnBounds(model,'EX_etoh[e]',0,'u');
model = changeRxnBounds(model,'EX_fe2[e]',-1000,'l');
model = changeRxnBounds(model,'EX_fe2[e]',1000,'u');
model = changeRxnBounds(model,'EX_nh4[e]',-1000,'l');
model = changeRxnBounds(model,'EX_nh4[e]',0,'u');
model = changeRxnBounds(model,'EX_pe_hs[e]',-0.00005,'l');
model = changeRxnBounds(model,'EX_pe_hs[e]',1000,'u');
model = changeRxnBounds(model,'EX_ps_hs[e]',-0.00005,'l');
model = changeRxnBounds(model,'EX_ps_hs[e]',1000,'u');
model = changeRxnBounds(model,'EX_sarcs[e]',-0.0053,'l');
model = changeRxnBounds(model,'EX_sarcs[e]',0.0086,'u');


%for loop to read each column and construct tissue models
    for i = 1:264
        expressionData.value = expressionData.rawValue(:,i);
        [expressionRxns parsedGPR] = mapExpressionToReactions(model, expressionData);
        %median(prctile(expressionData.rawValue, 25))
        expressionRxns(139,1) = 1;
        expressionRxns(3539,1) = 1;
        expressionRxns(3538,1) = 1;
        expressionRxns(4870,1) = 1;
        expressionRxns(4869,1) = 1;
        expressionRxns(4868,1) = 1;
        a = median(prctile(expressionRxns, 50));
        tissueModel = iMAT(model, expressionRxns, 0, a, tol, core);
        tissueModel = removeUnusedGenes(tissueModel);
        save(['tissueModel_' num2str(i) '.mat'],'tissueModel');
    end
    
