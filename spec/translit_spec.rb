require 'translit'

describe "translit" do
  let(:russian) { "Транслитерация между кириллицей и латиницей с коммандной строки или в твоей программе" }
  let(:russian_transliteration) { "Transliteratsiya mezhdu kirillitsej i latinitsej s kommandnoj stroki ili v tvoej programme" }
  let(:english) { "Transliteration between cyrillic <-> latin from command-line or your program" }
  let(:ukrainian) { "Транслітерація між кирилицею <-> Латинська з командного рядка або вашої програми" }
  let(:ukrainian_transliteration) { "Transliteratsiya mizh kyrylytseyu <-> Latyns'ka z komandnoho ryadka abo vashoyi prohramy" }
  # This is broken
  let(:english_transliteration) { "Транслитератион бетвеен cыриллиc <-> латин фром cомманд-лине ор ёур програм" }
  let(:ukrainian_english_transliteration) { "Транслітератіон бетвеен cирілліc <-> латін фром cомманд-ліне ор иоур проґрам" }

  it "transliterates from russian to english" do
    expect(Translit.convert(russian, :english)).to eq(russian_transliteration)
  end

  it "transliterates from ukrainian to english" do
    expect(Translit.convert(ukrainian, :english)).to eq(ukrainian_transliteration)
  end

  it "transliterates from english to russian" do
    expect(Translit.convert(english, :russian)).to eq(english_transliteration)
  end

  it "transliterates from english to ukrainian" do
    expect(Translit.convert(english, :ukrainian)).to eq(ukrainian_english_transliteration)
  end

  describe "ukrainian to english transliteration" do
    it "should put yu ahead of ü" do
      #"yu"=>["Ю","ю"], "ju"=>["Ю","ю"], "ü"=>["Ю","ю"]
      expect(Translit.convert("Ю", :english)).to eq("Yu")
    end

    it "should put yu ahead of ü even at the end of a word" do
      expect(Translit.convert("Біблію", :english)).to eq("Bibliyu")
    end

    it "should put ye ahead of je" do
      #"ye"=>["Є","є"], "je"=>["Є","є"]
      expect(Translit.convert("Є", :english)).to eq("Ye")
    end
  end

  describe "english to ukrainian transliteration" do
    it "should put yu ahead of ü even at the end of a word" do
      expect(Translit.convert("Bible", :ukrainian)).to eq("Бібле")
    end
  end

  describe "edge cases" do
    it "should handle empty strings" do
      expect(Translit.convert("", :english)).to eq("")
    end

    it "should handle strings with empty lines" do
      expect(Translit.convert("\n\n", :english)).to eq("\n\n")
    end
  end
end
