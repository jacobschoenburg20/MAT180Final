function percentCorrect = solution_checker(test_solutions, test_predictions)
%Returns the percentage of correctly identified digits

numErrors = 0;
for i = 1:size(test_solutions,2)
    if test_solutions(i) ~= test_predictions(i)
        numErrors = numErrors + 1;
    end
end

percentCorrect = 1 - numErrors/size(test_solutions,2);