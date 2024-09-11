=begin
  2) Dado a sequência de Fibonacci, onde se inicia por 0 e 1
  e o próximo valor sempre será a soma dos 2 valores anteriores
  (exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...), escreva um programa
  na linguagem que desejar onde, informado um número, ele calcule a
  sequência de Fibonacci e retorne uma mensagem avisando se o número
  informado pertence ou não a sequência.
=end

# Calcula a sequência
def fibo(num)
  return [] if num <= 0
  return [0] if num == 1

  a, b = 0, 1
  seq_fibo = [a, b]

  while seq_fibo.size < num
    prox_num = a + b
    seq_fibo << prox_num
    a = b
    b = prox_num
  end

  return seq_fibo
end

# Verifica se o número informado pertence à sequência de Fibonacci
def pertence_a_sequencia?(numero, sequencia)
  if sequencia.include?(numero)
    return "O número #{numero} pertence à sequência: #{sequencia.join(', ')}"
  else
    return "O número #{numero} não pertence à sequência: #{sequencia.join(', ')}"
  end
end

# Escreve os resultados no arquivo texto
File.open('./Exercicios/exr02.txt', 'w') do |file|
  file.puts("-- Exemplos --")
  file.puts(pertence_a_sequencia?(0, fibo(0)))
  file.puts(pertence_a_sequencia?(1, fibo(1)))
  file.puts(pertence_a_sequencia?(5, fibo(5)))
  file.puts(pertence_a_sequencia?(8, fibo(8)))
  file.puts(pertence_a_sequencia?(10, fibo(10)))
  file.puts(pertence_a_sequencia?(17, fibo(17)))
end
