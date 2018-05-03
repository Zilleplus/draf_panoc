clear all;
%%
addpath(genpath('../Matlab'));
%%
problem.dimension = 2;
problem.constraint_type = 'costum';

upper_bound = 4;
lower_bound = -4;
g = @(x) indBox(x,upper_bound,lower_bound);
problem.constraint = g;

solver_params.tolerance = 1e-12;
solver_params.buffer_size = 20;
solver_params.max_iterations = 200;

solution = [0;0];
%%
panoc('init',problem,solver_params);
number_of_iterations = panoc('solve',solution,@rosen);
panoc('cleanup');

function [proxg,g] = indBox(x,upper_bound,lower_bound)
    % indicator box fuction
    proxg = min(upper_bound, max(lower_bound, x));
    g = 0;
end