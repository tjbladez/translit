# coding: utf-8

require 'rubygems'
require 'riot'
$:.unshift "#{File.dirname(__FILE__)}/../lib"
require 'translit'

context "Translit#convert" do
  should("transliterate English to Cyrillic") do
    Translit.convert("Jeto prostoj test")
  end.equals("Это простой тест")

  should("transliterate Cyrillic to English") do
    Translit.convert("Это простой тест")
  end.equals("Jeto prostoj test")

  should("leave input unmodified by default") do
    str = "Это простой тест"
    Translit.convert(str)
    str
  end.equals("Это простой тест")
end

context "Translit#convert!" do
  should("transliterate input in place") do
    str = "Это простой тест"
    Translit.convert!(str)
    str
  end.equals("Jeto prostoj test")
end

context "Translit#convert with enforced language" do
  should("transliterate to that language") { Translit.convert("test", :english)}.equals("test")
  should("keep it the same if language matched the text") {Translit.convert("test", :russian)}.equals("тест")

  should("transliterate to english language if input language is mixed") { Translit.convert("test тест", :english)}.equals("test test")
  should("transliterate to russian language if input language is mixed") { Translit.convert("test тест", :russian)}.equals("тест тест")
end
