=begin
  1) Observe o trecho de código abaixo: int INDICE = 13, SOMA = 0, K = 0;
  Enquanto K < INDICE faça { K = K + 1; SOMA = SOMA + K; }
  Imprimir(SOMA);
  Ao final do processamento, qual será o valor da variável SOMA?
=end

INDICE = 13
soma, k = 0, 0

while k < INDICE
  k += 1
  soma += k
end


# Exibe no terminal
puts(soma)


# Escreve no arquivo texto do enunciado
File.open('./Exercicios/exr01.txt', 'w') do |file|
  file.puts("Ao final do processamento, o valor de SOMA será: #{soma}")
end
