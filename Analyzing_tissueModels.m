% Code for analyzing tissue specific models

changeCobraSolver('gurobi', 'LP')
changeCobraSolver('gurobi', 'MILP')

objective = {'CAATPS', 'EX_gln_L[e]', 'EX_glu_L[e]', 'biomass_maintenance'}

filenumber = 1:10
for i = filenumber
    tissueModel = readCbModel(['tissueModel_' num2str(i) '.mat'])
    tissueModel = changeObjective(tissueModel, objective);
    opt_tissue = optimizeCbModel(tissueModel);
    reactions = tissueModel.rxns;
    genes = tissueModel.genes;
    flux = opt_tissue.x;
    [minFlux,maxFlux] = fastFVA(tissueModel,90);
    [grRatio, grRateKO, grRateWT, hasEffect, delRxns, fluxSolution] = singleGeneDeletion(tissueModel, 'FBA');
    [grRatio_rxn, grRateKO_rxn, grRateWT_rxn, hasEffect_rxn, delRxn_rxn, fluxSolution_rxn] = singleRxnDeletion(tissueModel, 'FBA');
    my_file = sprintf('tissuemodel_%d.csv', i);
        fid = fopen(my_file, 'w');
        for j = 1:size(reactions)
            fprintf(fid, '%s\t%f\t%f\t%f\t%f\t%f\n', reactions{j}, flux(j), minFlux(j), maxFlux(j), grRatio_rxn(j), grRateKO_rxn(j));
        end
        fclose(fid);
    my_gene = sprintf('geneKO_%d.csv', i);
        fid = fopen(my_gene, 'w');
        for k = 1:size(genes)
            fprintf(fid, '%s\t%f\t%f\n', genes{k}, grRatio(k), grRateKO(k));
        end
        fclose(fid);
end
