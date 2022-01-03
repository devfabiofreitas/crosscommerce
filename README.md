# CrossCommerce
### Para executar o projeto:
- Instale as dependências com `mix deps.get`
- Crie o banco e execute as migrations com `mix ecto.setup`
- Inicie o servidor com `iex -S mix phx.server`

- **Para Buscar e Salvar os Números**: `Crosschallenge.play`
- Aguarde a busca e salvamento
- **Para vizualzizar todos os numeros ordenados em uma só página:** http://localhost:4000/api/show
- **Para uma vizualizacao semelhante a api dienekes (100 por página):** http://localhost:4000/api/numbers?page=1

# ETAPA EXTRACT
A primeira etapa: extract, tinha como objetivo extrair todos os números de todas
as páginas disponíveis da api http://challenge.dienekes.com.br/api/numbers, nessa etapa decidi usar a biblioteca de client HTTP 
Tesla por ser de facil implementação porém muito eficiente.

**Crosschallenge.NumberExtract.FetchNumbers**


![Capturar](https://user-images.githubusercontent.com/32686962/147984161-1c5ff8f6-8d64-412c-90cf-ef0278cede85.PNG)

A extração deveria ocorrer nas milhares de páginas que a api disponibilizava, até que o retorno das solicitações fosse um array vazio. Para esta tarefa as características do Elixir / Erlang se sobressaem, a facilidade em trabalhar com concorrência e recursividade, permite desenvolver aplicações com melhores peformances. 

Nesse sentido a função recursiva `com_fetch` extrai de 30 em 30 páginas (enumerable), executando algumas dessas páginas em concorrência, de acordo com os parâmetros estabelecidos na `Task.async_stream`. A função `state()` tem o objetivo de auxiliar quando a função com_fetch deve parar de "se chamar", isso ocorre, como mencionado anteriormente, quando a chamada da requisição retornar um array vazio.

**Crosschallenge.NumberExtract.GetNumberAllPages**

![Capturar](https://user-images.githubusercontent.com/32686962/147985326-9deefff5-165e-4095-97fb-09c185817ae9.PNG)
![Capturar](https://user-images.githubusercontent.com/32686962/147985421-dc76da80-3849-4ba9-bf34-2cf745d2295c.PNG)
