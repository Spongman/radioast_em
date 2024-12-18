function output = entropy_condition(sigmasq)
global ALPHA_GLOBAL Q_GLOBAL
output = -sigmasq + Q_GLOBAL - ALPHA_GLOBAL * sigmasq .^ 2 .* (log(sigmasq) + 1);
