function error = find_residual(digit, singular_vector)
error = norm(digit - singular_vector*(singular_vector'*digit));