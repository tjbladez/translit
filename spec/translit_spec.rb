require 'translit'

describe "translit" do
  let(:russian) { "Транслитерация между кириллицей и латиницей с коммандной строки или в твоей программе" }
  let(:english) { "Transliteration between cyrillic <-> latin from command-line or your program" }

  it "transliterates from english to russian" do
    expect(Translit.convert(russian, :english)).to eq(english)
  end

  it "transliterates from english to ukrainian" do
    pending
  end

  it "transliterates from russian to english " do
    pending
  end

  it "transliterates from ukrainian to english " do
    pending
  end
end
