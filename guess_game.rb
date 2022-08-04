def get_hint_desc(key)
    words_with_desc = {
        "Ruby on Rails" => "A server-side web application framework written in Ruby under the MIT License.",
        "React JS" => "A free and open-source front-end JavaScript library for building user interfaces based on UI components.",
        "Vue JS" => "An open-source model–view–viewmodel front end JavaScript framework for building user interfaces and single-page applications.",
        "Full Scale" => "Build your development team quicly and affordably.",
        "Hello World!" => "A very know message for every beginner programmer."
    }

    words_with_desc[key]
end

def convert_to_underscores(word)
    underscores = ''
    word.split('').each do |c|
        if c == ' '
            underscores += c
        else
            underscores += '_'
        end
    end

    underscores
end

def get_indices(word, guess_char)
    "Hello World".enum_for(:scan, /(?=#{guess_char})/).map do
        Regexp.last_match.offset(0).first
    end
end

def execute
    puts "---------- GUESS GAME ----------"

    guess_words = [
        "Ruby on Rails",
        "React JS",
        "Vue JS",
        "Full Scale",
        "Hello World!"
    ]

    # select word randomly
    secret_word = guess_words.sample

    hint = get_hint_desc(secret_word)

    puts "Hint: #{hint}"
    puts convert_to_underscores(secret_word)

    puts "Enter a character: "
    char = gets.chomp
    puts secret_word.index(char)
    puts get_indices(secret_word, char)
end

execute
