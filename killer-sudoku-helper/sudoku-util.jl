function findCombination(
	solutions::Set{Set{Int}},
	solution::Set{Int},
	totalSum::Int,
	maxLength::Int,
	available::Set{Int},
)
	println("update: ", solution, " available: ", available)

	if length(solution) == maxLength && sum(solution) == totalSum
		push!(solutions, copy(solution))
		return
	end

	if !isempty(available)
		for i in available
			push!(solution, i)
			findCombination(solutions, solution, totalSum, maxLength, filter(elem -> elem != i, available))
			pop!(solution)
		end
	end
end

function combinations_in_cage(totalSum::Int, maxLength::Int, fixed::Vector{Int} = Int[])
	solutions = Set{Set{Int}}()
	solution = Set{Int}()
	available = Set(i for i in 1:9 if !(i in fixed))
	findCombination(solutions, solution, totalSum, maxLength, available)
	return solutions
end

# combinations_in_cage(10, 2)
solutions = combinations_in_cage(5, 2, [1, 4, 5, 6, 7, 8])

for solution in solutions
	println(solution)
end
