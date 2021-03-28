opts = spreadsheetImportOptions("NumVariables", 10);
opts.Sheet = "Sheet1";
opts.DataRange = "B4:K11";
opts.VariableNames = ["Im05", "Itx05", "Im06", "Itx06", "Im07", ...
    "Itx07", "Im08", "Itx08", "Im09", "Itx09"];
opts.VariableTypes = ["double", "double", "double", ...
    "double", "double", "double", "double", ...
    "double", "double", "double"];
I_cap = readtable("D:\Github\WPT-Motor\Journal-DC-Motor\Design_consideration\Capacitor_current.xlsx", ...
    opts, "UseExcel", false);
clear opts
%%
k=5
Im05=I_cap.Im05(1:k);
Im05=zeros(5,1);
Im06=I_cap.Im06(1:k);
Im07=I_cap.Im07(1:k);
Im08=I_cap.Im08(1:k);
Im09=I_cap.Im09(1:k);
Im=[Im09,Im08,Im07,Im06,Im05,Im06,Im07,Im08,Im09]';
Itx05=I_cap.Itx05(1:k);
Itx06=I_cap.Itx06(1:k);
Itx07=I_cap.Itx07(1:k);
Itx08=I_cap.Itx08(1:k);
Itx09=I_cap.Itx09(1:k);
Itx=[Itx09,Itx08,Itx07,Itx06,Itx05,Itx06,Itx07,Itx08,Itx09]';
%%
A=zeros(9,5,2);
A(:,:,1) = Im;
A(:,:,2) = Itx;


z= {'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9'};
z= {'1 2 3 4 5','1 2 3 4 5', ...
    '1 2 3 4 5','1 2 3 4 5', ...
    '1 2 3 4 5','1 2 3 4 5', ...
    '1 2 3 4 5','1 2 3 4 5','1 2 3 4 5'};

plotBarStackGroups(A,z)
set(gcf,'Position',[100 100 1200 400])

