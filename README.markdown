## What is it / Что это ##

It is a simple library allowing you to transliterate between cyrillic and latin.
R: Это простая и элегантная программа позволит вам проводить транслитерацию между кирилицой и латиницой.

It is easy to use from the command line and in your code.
R: Ее легко использовать как в коммандной строке так и в вашем коде.

Install it via:
R: Устанавливается она просто:
<code>gem install translit</code>

## USAGE ##

To use translit from the command line you just type
R: Для использовавания translit в командной строке просто напишите
<code>translit [your_input_here]</code>
where your input could be in cyrillic or latin
R: где ваш текст может быть написан успользуя русскую клавиатуру либо латинскую

Or you can translit stdin now via just:
R: Либо вы можете просто вызвать программу и передавать текст в потоке чтения данных
<code>translit</code>

To stop stdin input use .\n (press dot and then enter on the new line)
R: Чтобы прервать поток используется стандарная система .\n (напишите . и нажмите enter на чистой строке)