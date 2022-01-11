function [time, data] = importfile_only_sim(filename, dataLines)
%IMPORTFILE Import data from a text file
%  [TIME, DATA] = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as column
%  vectors.
%
%  [TIME, DATA] = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  [time, data] = importfile("G:\My Drive\WPT-MOTOR\Test-Result\2021.11.23\C2VAB-50V-noload-onlyMotor00000.dat", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 24-Nov-2021 10:29:40

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
time = tbl.time;
data = tbl.data;
end