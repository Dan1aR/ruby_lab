class SolverController < ApplicationController
    def index
    end

    def create
        # render plain: form_params['n']
        @solve = Solve.new(form_params)
        @solve.solution

        @num_subarrays = @solve.num_subarrays
        @ans_array = @solve.ans_array
        @ans_ids = @solve.ans_ids
        @array = @solve.input_array
        @longest_one = @solve.longest_one
    end

    private def form_params
        params.require(:data_form).permit(:n, :a)
    end
end
