# CrossCommerce
### Para executar o projeto:
- Instale as dependências com `mix deps.get`
- Crie o banco e execute as migrations com `mix ecto.setup`
- Inicie o servidor com `iex -S mix phx.server`

- **Para Buscar e Salvar os Números**: `Crosschallenge.play`
- Aguarde a busca e salvamento
- **Para vizualizar todos os numeros ordenados em uma só página:** http://localhost:4000/api/show
- **Para uma vizualizacao semelhante a api dienekes (100 por página):** http://localhost:4000/api/numbers?page=1

# ETAPA EXTRACT
A primeira etapa: extract, tinha como objetivo extrair todos os números de todas
as páginas disponíveis da api http://challenge.dienekes.com.br/api/numbers, nessa etapa decidi usar a biblioteca de client HTTP 
Tesla por ser de facil implementação porém muito eficiente.

**Crosschallenge.NumberExtract.FetchNumbers**


![Capturar](https://user-images.githubusercontent.com/32686962/147984161-1c5ff8f6-8d64-412c-90cf-ef0278cede85.PNG)

A extração deveria ocorrer nas milhares de páginas que a api disponibilizava, até que o retorno das solicitações fosse um array vazio. Para esta tarefa, as características do Elixir / Erlang são imprescindíveis, haja vista sua facilidade em trabalhar com concorrência e paralelismo.

Nesse sentido, a função recursiva `com_fetch` extrai de 30 em 30 páginas (enumerable), executando algumas dessas páginas em concorrência, de acordo com os parâmetros estabelecidos na `Task.async_stream`. A função `state()` tem o objetivo de auxiliar quando a função com_fetch deve parar de "se chamar", isso ocorre, como mencionado anteriormente, quando a chamada da requisição retornar um array vazio.

**Crosschallenge.NumberExtract.GetNumberAllPages**

![Capturar](https://user-images.githubusercontent.com/32686962/147985326-9deefff5-165e-4095-97fb-09c185817ae9.PNG)
![Capturar](https://user-images.githubusercontent.com/32686962/147985421-dc76da80-3849-4ba9-bf34-2cf745d2295c.PNG)

# ETAPA TRANSFORM
A etapa Transform tinha como objetivo ordenar, de forma crescente, todos os números extraidos na etapa anterior. 
Decidi implementar como algoritimo de ordenação Merge Sort, tal algaritimo fragmenta a lista inicial, ordena as fragmentacoções para no final juntar as listas, retornando agora uma lista totalmente ordenada como ilustra a figura ao lado do código.

**Crosschallenge.Transform.MergeSort**

![Capturar](https://user-images.githubusercontent.com/32686962/147996733-a7cfaf10-5555-4b0d-bc58-f1da515644b5.PNG)
![300px-Merge_sort_algorithm_diagram svg](https://user-images.githubusercontent.com/32686962/147996485-0d193f1d-9310-4b07-b0c4-3cb03873fe36.png)

# ETAPA LOAD
Por fim, a etapa Load tinha por fito expor uma api com
 todos os números extraidos e ordenados nas etapas anteriores. Dedici assim, exibir o resultado de duas formas diferentes.

**Uma vizualização semelhante a API que havia extraido os dados:** com 100 numeros por página e até o momento: 10_000 páginas.
 ![Capturar](https://user-images.githubusercontent.com/32686962/147997589-30ef37fa-1236-4794-8a5e-8ca5b6bc654a.PNG)

**Uma vizualização que retorna todos os 1_000_000 de números**

![Capturar](https://user-images.githubusercontent.com/32686962/147997919-a37fa2ba-037f-42d2-9662-ea6d865d1963.PNG)

## TESTES
Para auxiliar na cobertura dos testes utilizei a biblioteca ExCoveralls, essa biblioteca nos permite um melhor detalhamento dos testes a serem realizados demostrando, por exemplo, quantos testes relevantes deveriam ser realizados e quantos testes faltam para cobrir-los. Além de nos permitir um arquivo detalhado html, demostrando linha a linha onde houve, ou não, efetuação de testes.

**Vizualização `mix test --cover`**

![Capturar](https://user-images.githubusercontent.com/32686962/147998707-c55fd1ce-ac5a-4c75-ac4c-652f9ce6c356.PNG)
