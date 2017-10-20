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
end
