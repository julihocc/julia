function findCombination(
	solutions::Set{Set{Int}},
	solution::Set{Int},
	totalSum::Int,
	maxLength::Int,
	available::Set{Int},
)
	println("solution: ", solution, " available: ", available)

	if length(solution) > maxLength || sum(solution) > totalSum 
		return
	end

	if length(solution) == maxLength && sum(solution) == totalSum
		push!(solutions, copy(solution))
		return
	end

	if !isempty(available)
		for i in available
			findCombination(solutions, union(solution, i), totalSum, maxLength, setdiff(available, [i]))
		end
	end
end

function processSolutions(solutions::Set{Set{Int}})
	println("processing solutions...")
	println("solutions: ", solutions)
	return [sort!(collect(solution)) for solution in solutions]
end

function combinations_in_cage(totalSum::Int, maxLength::Int, fixed::Vector{Int} = Int[])
	solutions = Set{Set{Int}}()
	solution = Set{Int}()
	available = Set(i for i in 1:9 if !(i in fixed))
	findCombination(solutions, solution, totalSum, maxLength, available)
	return solutions
end

# combinations_in_cage(10, 2)
solutions = combinations_in_cage(45, 9) # == [[1, 2, 3, 4, 5, 6, 7, 8, 9]]


