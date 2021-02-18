class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
attr_reader :pegs

  def self.valid_pegs?(chars)
   chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end
  

def initialize(chars)
  if Code.valid_pegs?(chars) == true
    @pegs = chars.map {|char| char.upcase}
  else
    raise "Invalid Pegs"
  end
end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end
  def self.from_string(string)
   str_arr = string.split("")
  Code.new(str_arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(user_guess)
    count = 0
    (0...user_guess.length).each do |i|
      count +=1 if user_guess[i] == self[i]
    end
  count
  end

def num_near_matches(user_guess)
  count = 0 
  (0...user_guess.length).each do |i|
    if user_guess[i] != self[i] && self.pegs.include?(user_guess[i])
      count += 1
    end
  end
  count
end

def ==(other_code)
  if other_code == self.pegs
    return true
  else
    return false
  end
end

end
