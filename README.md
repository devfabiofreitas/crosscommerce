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
http://challenge.dienekes.com.br/api/numbers
A primeira etapa: extract, tinha como objetivo extrair todos os números da api http://challenge.dienekes.com.br/api/numbers, nessa etapa decidi usar a biblioteca de client HTTP 
Tesla por ser de facil implementação porém muito eficiente.

**Crosschallenge.NumberExtract.FetchNumbers **

