require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(user_input)
        puts  "Exact Matches: #{@secret_code.num_exact_matches(user_input)}"
        puts  "Near natches: #{@secret_code.num_near_matches(user_input)}"
    end

    def ask_user_for_guess
        puts  'Enter a code '
        user_input = Code.from_string(gets.chomp)
      self.print_matches(user_input)
      @secret_code == user_input
    end
end
