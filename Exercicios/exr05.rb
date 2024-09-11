=begin
  5) Escreva um programa que inverta os caracteres de um string.

  IMPORTANTE:
  a) Essa string pode ser informada através de qualquer entrada de
  sua preferência ou pode ser previamente definida no código;

  b) Evite usar funções prontas, como, por exemplo, reverse;
=end

def inverte_texto(str)
  texto_invertido = ""

  (str.size - 1).downto(0) { |i| texto_invertido += str[i] } # str[i] equivale à cada caracter da string 'str'

  return texto_invertido
end


# Escreve os resultados no arquivo texto
File.open('./Exercicios/exr05.txt', 'w') do |file|
  file.puts("Texto: anêmona", inverte_texto("anêmona"))
  file.puts("Texto: simplificado", inverte_texto("simplificado"))
  file.puts("Texto: exemplo", inverte_texto("exemplo"))
end
