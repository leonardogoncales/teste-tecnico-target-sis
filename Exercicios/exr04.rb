=begin
  4) Dado o valor de faturamento mensal de uma distribuidora, detalhado por estado:
  • SP – R$67.836,43
  • RJ – R$36.678,66
  • MG – R$29.229,88
  • ES – R$27.165,48
  • Outros – R$19.849,53

  Escreva um programa na linguagem que desejar onde calcule o percentual
  de representação que cada estado teve dentro do valor total mensal da distribuidora.
=end

fat_mensal = {
  "SP": 67836.43,
  "RJ": 36678.66,
  "MG": 29229.88,
  "ES": 27165.48,
  "Outros": 19849.53
}


def porcentual_representacao_por_estado(fat_mensal)
  fat_total = fat_mensal.values.sum
  porcentagens = {}

  fat_mensal.each do |estado, fat|
    porcentagem = (fat / fat_total) * 100
    porcentagens[estado] = porcentagem.round(2)
  end

  return porcentagens
end

porcentagens = porcentual_representacao_por_estado(fat_mensal)

# Escreve os resultados no arquivo texto
File.open('./Exercicios/exr04.txt', 'w') do |file|
  porcentagens.each do |estado, porcentagem|
    file.puts("Estado: #{estado}, Representação: #{porcentagem}%")
  end
end
