%% This script is to initialise the default settings for J & L across the functions


% initialise J default settings
app.max_J_per_batch=[];
if isempty(app.max_J_per_batch)
    app.max_J_per_batch=2000;
else
end
app.p_J=[];
if isempty(app.p_J)
    app.p_J = 0.999;
else
end

app.perc.Value = 0;

% initialise default settings for L
app.delta_LEditField.Value=0.99;
app.var_L = 1;
app.std_thEditField_L.Value = 1e-06;
app.std_th = app.std_thEditField_L.Value;


%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0