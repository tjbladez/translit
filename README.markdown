## English ##

It is a simple library allowing you to transliterate between cyrillic and latin. It is easy to use from the command line and in your code.

Install it via: <code>gem install translit</code>

### Usage ###

To use translit from the command line you just type <code>translit [your_input_here]</code> where your input could be in cyrillic or latin.

Or you can translit stdin now via just: <code>translit</code>. To stop stdin input use .\n (press dot and then enter on the new line)

#### Ruby
Translit using autodetection:

```
Translit.convert("Отличный день") #=> "Otlichnyj den'"
Translit.convert("Otlichnyj den'") #=> "Отличный день"
```
Translit forcing target language:

```
Translit.convert("Отличный den'", :russian) #=> "Отличный день"
Translit.convert("Otlichnyj день", :english) #=> "Otlichnyj den'"
```

## Русский ##

Эта простая и элегантная программа позволит вам проводить транслитерацию между кириллицей и латиницей. Ее легко использовать, как в командной строке, так и в вашем коде.

Устанавливается она просто: <code>gem install translit</code>

### Использование ###

Чтобы использовать translit в командной строке, просто наберите <code>translit [your_input_here]</code>, где ваш текст может быть набран в латинице или кириллице.

Либо вы можете просто вызвать программу и передавать текст в потоке чтения данных <code>translit</code>. Чтобы прервать поток используется стандарная система .\n (напишите . и нажмите enter на чистой строке)

#### Ruby
Транслитирование с автоопределнием языка:

```
Translit.convert("Отличный день") #=> "Otlichnyj den'"
Translit.convert("Otlichnyj den'") #=> "Отличный день"
```
Транслитирование на определенный язык:

```
Translit.convert("Отличный den'", :russian) #=> "Отличный день"
Translit.convert("Otlichnyj день", :english) #=> "Otlichnyj den'"
