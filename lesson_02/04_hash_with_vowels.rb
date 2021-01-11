# frozen_string_literal: true

# Fill in the hash with vowels, where the value is the ordinal number
# of the letter in the alphabet (a - 1).
alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
vowels = %w[a e i o u y]
vowels_hash = {}
vowels.each do |literal|
  alphabet.each do |vowel|
    if literal == vowel
      vowels_hash[literal.to_s] = alphabet.index(literal) + 1
      break
    end
  end
end
puts vowels_hash
