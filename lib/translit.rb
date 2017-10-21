# Resources for Ukrainian transliteration
# * http://en.ukrlandia.com.ua/cyrillic-alphabets/
# * http://www.ukrainiansintheuk.info/eng/00/translit-e.htm

module Translit
  # Ukrainian only chars: Ґ, І, Ї, Є, ‘
  UKRAINIAN_ONLY_CHARS = %w(Ґ ґ І і Ї ї Є є ‘)

  # Russian only chars: Э
  RUSSIAN_ONLY_CHARS = %w(Э э)

  def self.convert!(text, enforce_language = nil)
    language = if enforce_language
      enforce_input_language(text.split(/\s+/).first, enforce_language)
    else
      detect_input_language(text.split(/\s+/).first)
    end

    map = self.send(language.to_s + "_to_" + enforce_language.to_s).sort_by {|k,v| k.length}.reverse
    map.each do |translit_key, translit_value|
      text.gsub!(translit_key.capitalize, translit_value.first)
      text.gsub!(translit_key, translit_value.last)
    end
    text
  end

  def self.convert(text, enforce_language = nil)
    convert!(text.dup, enforce_language)
  end

private

  def self.invert_character_map(map)
    map.dup.inject({}) do |acc, tuple|
      rus_up, rus_low = tuple.last
      eng_value       = tuple.first
      acc[rus_up]  ? acc[rus_up]  << eng_value.capitalize : acc[rus_up]  = [eng_value.capitalize]
      acc[rus_low] ? acc[rus_low] << eng_value            : acc[rus_low] = [eng_value]
      acc
    end
  end

  def self.detect_input_language(text)
    if text.scan(/\w+/).empty?
      slavic_language(text)
    else
      :english
    end
  end

  def self.enforce_input_language(text, language)
    if language == :english
      slavic_language(text)
    else
      :english
    end
  end

  def self.slavic_language(text)
    # If text contains Ukrainian chars we know it is Ukrainian
    if UKRAINIAN_ONLY_CHARS.any? { |uk_char| text.include? uk_char }
      :ukrainian
    else
      :russian
    end
  end

  # Unsupported latin: "ä"=>["Э","э"], "ü"=>["Ю","ю"],
  def self.english_to_ukrainian
    { "a"=>["А","а"], "b"=>["Б","б"], "v"=>["В","в"], "h"=>["Г","г"], "g"=>["Ґ","ґ"], "d"=>["Д","д"], "e"=>["Е","е"], "ye"=>["Є","є"], "je"=>["Є","є"], "zh"=>["Ж","ж"],
      "z"=>["З","з"], "i"=>["І","і"], "yi"=>["Ї","ї"], "j"=>["Й","й"], "k"=>["К","к"], "l"=>["Л","л"], "m"=>["М","м"], "n"=>["Н","н"], "o"=>["О","о"], "p"=>["П","п"], "r"=>["Р","р"],
      "s"=>["С","с"], "t"=>["Т","т"], "u"=>["У","у"], "f"=>["Ф","ф"], "kh"=>["Х","х"], "x"=>["Кс","кс"], "ts"=>["Ц","ц"], "ch"=>["Ч","ч"], "sh"=>["Ш","ш"], "w"=>["В","в"],
      "shch"=>["Щ","щ"], "sch"=>["Щ","щ"], "y"=>["И","и"], "'"=>["Ь","ь"], "yu"=>["Ю","ю"], "ju"=>["Ю","ю"],
      "ya"=>["Я","я"], "ja"=>["Я","я"], "q"=>["К","к"]}
  end

  def self.english_to_russian
    { "a"=>["А","а"], "b"=>["Б","б"], "v"=>["В","в"], "g"=>["Г","г"], "d"=>["Д","д"], "e"=>["Е","е"], "yo"=>["Ё","ё"], "jo"=>["Ё","ё"], "ö"=>["Ё","ё"], "zh"=>["Ж","ж"],
      "z"=>["З","з"], "i"=>["И","и"], "j"=>["Й","й"], "k"=>["К","к"], "l"=>["Л","л"], "m"=>["М","м"], "n"=>["Н","н"], "o"=>["О","о"], "p"=>["П","п"], "r"=>["Р","р"],
      "s"=>["С","с"], "t"=>["Т","т"], "u"=>["У","у"], "f"=>["Ф","ф"], "h"=>["Х","х"], "x"=>["Кс","кс"], "ts"=>["Ц","ц"], "ch"=>["Ч","ч"], "sh"=>["Ш","ш"], "w"=>["В","в"],
      "shch"=>["Щ","щ"], "sch"=>["Щ","щ"], "#"=>["Ъ","ъ"], "y"=>["Ы","ы"], "'"=>["Ь","ь"], "je"=>["Э","э"], "ä"=>["Э","э"], "yu"=>["Ю","ю"], "ju"=>["Ю","ю"],
      "ü"=>["Ю","ю"], "ya"=>["Я","я"], "ja"=>["Я","я"], "q"=>["Я","я"]}
  end

  def self.russian_to_english
    @russian ||= invert_character_map(english_to_russian)
  end

  def self.ukrainian_to_english
    @ukrainian ||= invert_character_map(english_to_ukrainian)
  end
end
