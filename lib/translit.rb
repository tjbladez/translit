# coding: utf-8

module Translit
  def self.convert(text, enforce_language = nil)
    language = if enforce_language
      enforce_input_language(enforce_language)
    else
      detect_input_language(text.split(/\s+/).first)
    end

    map = self.send(language.to_s).sort_by {|k,v| v.length <=>  k.length}
    map.each do |translit_key, translit_value|
      text.gsub!(translit_key.capitalize, translit_value.first)
      text.gsub!(translit_key, translit_value.last)
    end
    text
  end

private
  def self.create_russian_map
    self.english.inject({}) do |acc, tuple|
      rus_up, rus_low = tuple.last
      eng_value       = tuple.first
      acc[rus_up]  ? acc[rus_up]  << eng_value.capitalize : acc[rus_up]  = [eng_value.capitalize]
      acc[rus_low] ? acc[rus_low] << eng_value            : acc[rus_low] = [eng_value]
      acc
    end
  end

  def self.detect_input_language(text)
    text.scan(/\w+/).empty? ? :russian : :english
  end

  def self.enforce_input_language(language)
    if language == :english
      :russian
    else
      :english
    end
  end

  def self.english
    {
      "a" => ["А", "а"],
      "b" => ["Б", "б"],
      "v" => ["В", "в"],
      "g" => ["Г", "г"],
      "d" => ["Д", "д"],
      "e" => ["Е", "е"],
      "ye" => ["Ё", "ё"],
      "e" => ["Ё", "ё"],
      "yo" => ["Ё", "ё"],
      "zh" => ["Ж", "ж"],
      "z" => ["З", "з"],
      "i" => ["И", "и"],
      "yi" => ["И", "и"],
      "y" => ["Й", "й"],
      "k" => ["К", "к"],
      "l" => ["Л", "л"],
      "m" => ["М", "м"],
      "n" => ["Н", "н"],
      "o" => ["О", "о"],
      "p" => ["П", "п"],
      "r" => ["Р", "р"],
      "s" => ["С", "с"],
      "t" => ["Т", "т"],
      "u" => ["У", "у"],
      "f" => ["Ф", "ф"],
      "kh" => ["Х", "ч"],
      "ts" => ["Ц", "ц"],
      "ch" => ["Ч", "ч"],
      "sh" => ["Ш", "ш"],
      "shch" => ["Щ", "щ"],
      "e" => ["Э", "э"],
      "yU" => ["Ю", "ю"],
      "YA"=>["Я", "я"],
      "'" => ['Ъ', 'ъ'],
      "Y" => ["Ы", "ы"],
      "'" => ['Ь', 'ь']
    }
  end

  def self.russian
    @russian ||= create_russian_map
  end
end
