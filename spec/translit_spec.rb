require 'translit'

describe "translit" do
  let(:russian) { "Транслитерация между кириллицей и латиницей с коммандной строки или в твоей программе" }
  let(:russian_transliteration) { "Transliteratsiya mezhdu kirillitsej i latinitsej s kommandnoj stroki ili v tvoej programme" }
  let(:english) { "Transliteration between cyrillic <-> latin from command-line or your program" }
  # This is broken
  let(:english_transliteration) { "" }

  it "transliterates from english to russian" do
    expect(Translit.convert(russian, :english)).to eq(russian_transliteration)
  end

  it "transliterates from english to ukrainian" do
    pending
  end

  it "transliterates from russian to english " do
    # FIXME: This is broken, not sure why
    # expect(Translit.convert(english, :russian)).to eq(english_transliteration)
  end

  it "transliterates from ukrainian to english " do
    pending
  end
end
