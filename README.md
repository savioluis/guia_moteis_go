# 📱 Teste para Desenvolvedor Mobile (Flutter) - Segmento de Motéis  

Este repositório contém a implementação do desafio para avaliação de habilidades em **Flutter**, incluindo consumo de API, gerenciamento de estado e testes unitários.  

## 🚀 Descrição do Desafio  

O objetivo é criar uma réplica da tela de **listagem de motéis** (aba "Ir Agora") do aplicativo **Guia de Motéis GO**, consumindo dados de uma API mock fornecida.  

### 🔗 API Mock Utilizada  
Os dados dos motéis são obtidos a partir da seguinte URL:  
- [https://jsonkeeper.com/b/1IXK](https://jsonkeeper.com/b/1IXK)  

### 📌 Funcionalidades Implementadas  
✅ Listagem de motéis com **nome, preço e imagem**  
✅ Consumo de API utilizando `http`  
✅ Gerenciamento de estado com **Bloc**  
✅ Injeção de dependências com **GetIt**  
✅ Criação eficiente de DTOs com **json_annotation**  
✅ Testes unitários com **mocktail**  
✅ Geração de **coverage** com `lcov` e visualização em HTML  

## 🛠 Tecnologias Utilizadas  

- **Flutter** para o desenvolvimento da interface  
- **Dart** como linguagem de programação  
- **Bloc** para gerenciamento de estado  
- **http** para consumo da API  
- **json_annotation** para geração automática dos DTOs  
- **GetIt** para injeção de dependências  
- **mocktail** para mockar requisições HTTP nos testes  
- **lcov** para geração de relatórios de cobertura de testes  

## 📂 Estrutura do Projeto  

```plaintext
lib/
│── app/
│   ├── app.dart
│   ├── environment_constants.dart
│   ├── injections.dart
│
│── core/
│   ├── providers/http/
│   │   ├── http_client.dart
│   │   ├── i_http_client.dart
│   ├── services/
│   │   ├── motel_service.dart
│   │   ├── dtos/  # Todos os DTOs gerados automaticamente
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── colors/app_colors.dart
│   │   ├── colors/colors_extension.dart
│
│── src/
│   ├── features/home/
│   │   ├── presentation/
│   │   │   ├── home_controller.dart
│   │   │   ├── home_state.dart
│   │   │   ├── home_page.dart
│   │   ├── widgets/
│   │   │   ├── carousel/
│   │   │   ├── drawer/
│   │   │   ├── motel_card/
│
│── main.dart
```

## 🧪 Testes  

Os testes foram implementados utilizando **mocktail** para simular requisições HTTP e validar os principais fluxos da aplicação.  

Para rodar os testes unitários, utilize:  

```sh
flutter test
```

## 📊 Cobertura de Testes  

A cobertura de testes foi gerada utilizando **lcov**, permitindo visualizar os resultados em uma interface HTML.  

### Gerar o relatório de cobertura:  
```sh
flutter test --coverage
```

### Gerar os arquivos HTML e visualizar os resultados:  
```sh
genhtml coverage/lcov.info -o coverage/html
```

### Abrir o relatório no navegador:  
- **macOS:**  
  ```sh
  open coverage/html/index.html
  ```
- **Windows:**  
  ```sh
  start coverage/html/index.html
  ```
- **Linux:**  
  ```sh
  xdg-open coverage/html/index.html
  ```

---

## 🚀 Como Executar o Projeto  

### 1️⃣ Clone este repositório:  
```sh
git clone https://github.com/savioluis/guia_moteis_go.git
```

### 2️⃣ Acesse o diretório do projeto:  
```sh
cd guia_moteis_go
```

### 3️⃣ Instale as dependências:  
```sh
flutter pub get
```

### 4️⃣ Execute o projeto em um dispositivo ou emulador:  
```sh
flutter run
```

---

## 📄 Licença  

Este projeto foi desenvolvido para fins de avaliação técnica e não possui uma licença específica.
