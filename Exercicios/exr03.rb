=begin
  3) Dado um vetor que guarda o valor de faturamento diário de uma distribuidora,
  faça um programa, na linguagem que desejar, que calcule e retorne:
  • O menor valor de faturamento ocorrido em um dia do mês;
  • O maior valor de faturamento ocorrido em um dia do mês;
  • Número de dias no mês em que o valor de faturamento diário foi superior à média mensal.

  IMPORTANTE:
  a) Usar o json ou xml disponível como fonte dos dados do faturamento mensal;
  b) Podem existir dias sem faturamento, como nos finais de semana e feriados.
  Estes dias devem ser ignorados no cálculo da média;
=end

require 'json'

arquivo_json = File.read('./dados.json')
dados = JSON.parse(arquivo_json)

def menor_fat(lista)
  menor_valor = nil
  dia_fat = nil

  lista.each do |d|
    fat_atual = d["valor"]
    dia_atual = d["dia"]

    if (fat_atual > 0)
      if (menor_valor.nil? || fat_atual < menor_valor)
        menor_valor = fat_atual
        dia_fat = dia_atual
      end
    end
  end

  return { "Dia": dia_fat, "Faturamento": menor_valor }.to_json
end

def maior_fat(lista)
  maior_valor = nil
  dia_fat = nil

  lista.each do |d|
    fat_atual = d["valor"]
    dia_atual = d["dia"]

    if (fat_atual > 0)
      if (maior_valor.nil? || fat_atual > maior_valor)
        maior_valor = fat_atual
        dia_fat = dia_atual
      end
    end
  end

  return { "Dia": dia_fat, "Faturamento": maior_valor }.to_json
end

def qtde_dias_acima_media(lista)
  total_fat = 0
  qtde_dias_considerados = 0
  qtde_dias = 0

  lista.each do |d|
    fat_dia = d["valor"]

    if (fat_dia > 0)
      total_fat += fat_dia
      qtde_dias_considerados += 1
    end
  end

  media = (total_fat / qtde_dias_considerados) if qtde_dias_considerados > 0

  lista.each do |d|
    fat_dia = d["valor"]

    if (fat_dia > media)
      qtde_dias += 1
    end
  end

  return qtde_dias
end


# Escreve os resultados no arquivo texto
File.open('./Exercicios/exr03.txt', 'w') do |file|
  file.puts("Exercicio A menor faturamento: ", menor_fat(dados))
  file.print("\n")
  file.puts("Exercicio B maior faturamento: ", maior_fat(dados))
  file.print("\n")
  file.puts("Quantidade de dias acima da média: ", qtde_dias_acima_media(dados))
end
