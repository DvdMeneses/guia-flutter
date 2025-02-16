# guia_project

## Descrição do Projeto  
Este projeto é uma cópia da parte visual e de algumas funcionalidades da **tela inicial** do aplicativo **Guia de Motéis GO**, focando na aba **"Ir Agora"**, integrando boas práticas do Flutter para criar uma aplicação modular, escalável e eficiente, com gerenciamento de estado centralizado, consumo de dados via API e uma interface de usuário dinâmica.  

---



## 🎥 Video de Funcionamento  
[![Guia Project Video]](https://github.com/user-attachments/assets/fab3d7fa-866a-4b4d-93b6-1e16fb4e69c3
)




## Principais Componentes e Práticas Utilizadas:  

### 1. **Provider para Gerenciamento de Estados**  
O projeto utiliza o **Provider** para gerenciar o estado global dos dados, especificamente as informações sobre os motéis.  
- A classe **Moteis** é um `ChangeNotifier` que gerencia a lista de motéis e oferece métodos para buscar dados da API.  
---

### 2. **Consumo de Dados via API**  
A aplicação consome dados de uma API usando a biblioteca **http**.  
- A função `fetchMotelData()` realiza uma requisição HTTP GET para um endpoint e, em seguida, processa a resposta.  
- A resposta JSON é decodificada usando `jsonDecode` e os dados dos motéis são mapeados para a classe **Motel**, que representa a estrutura de dados de cada motel.  

---

### 3. **Estrutura da Interface do Usuário**  
A interface do usuário é projetada de maneira dinâmica, utilizando **Widgets personalizados** para exibir as informações:  
- **CustomDropdown**: Um widget personalizado que fornece uma lista suspensa de categorias ou filtros.  
- **CardPromo**: Exibe informações de promoções, como imagem, nome, localização e preço.  
- **CardMotel**: Exibe as informações detalhadas sobre cada motel.  
- **FilterBar**: Apresenta filtros ou opções de pesquisa.  

---

### 4. **Sliver Widgets para Layout Dinâmico**  
O projeto utiliza **Sliver Widgets**, como o `SliverToBoxAdapter` e o `SliverList`, para criar listas dinâmicas com rolagem eficiente.  
- O `SliverPersistentHeader` é usado para criar um cabeçalho fixo, permitindo uma interface de rolagem fluida e moderna, proporcionando uma melhor experiência do usuário.  

---

### 5. **Testes e Validação de Dados**  
A classe **Moteis** realiza o tratamento de erros, incluindo:  
- Verificação do código de status HTTP.  
- Validação da estrutura JSON.  
---

### 6. **Motel e Categoria**  
As classes **Motel** e **CategoryItem** representam a estrutura dos dados recebidos da API:  
- **Motel**: Contém propriedades como nome, imagem, preço e localização.  
- **CategoryItem**: Armazena informações sobre o nome e ícone da categoria do motel.  

---

### 7. **Componentes Reusáveis**  
O uso de componentes reusáveis, como:  
- **GenericAppBar**  
- **CustomDropdown**  
- **CardPromo**  
- **CardMotel**  
- **FilterBar**  

Facilita a manutenção e a reutilização do código, deixando a interface modular e flexível. Esses componentes podem ser facilmente ajustados ou reutilizados em diferentes partes da aplicação.  

---

## 📌 **Resumo**  
Este projeto integra várias boas práticas do Flutter, como:  
- ✅ **Gerenciamento de estado com o Provider.**  
- ✅ **Consumo de APIs com a biblioteca http.**  
- ✅ **Widgets personalizados para construção de interfaces.**  
- ✅ **Testes e validação de dados para garantir a robustez.**  
- ✅ **Sliver Widgets para rolagem dinâmica e fluida.**  

Essa abordagem **modular e escalável** é ideal para aplicações mais complexas, garantindo flexibilidade, desempenho e facilidade na manutenção do código.  

Video de funcionamento: 

https://youtube.com/shorts/Oix1kzihxkk?feature=share
