def first_anagram?(str1, str2)
  str1.split("").permutation(str1.length).to_a.map(&:join).include?(str2)
end

def second_anagram?(str1, str2)
  str1.each_char do |char|
    if str2.include?(char)
      str1.slice!(str1.index(char))
      str2.slice!(str2.index(char))
    end
  end

  str1.length == 0 && str2.length == 0
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  h1 = Hash.new { |h, k| h[k] = 0 }
  h2 = Hash.new { |h, k| h[k] = 0 }

  str1.each_char { |char| h1[char] += 1 }
  str2.each_char { |char| h2[char] += 1 }

  h1 == h2
end

def bonus(str1, str2)
  #add str1, delete str2
end

p bonus("test", "raoiua")
