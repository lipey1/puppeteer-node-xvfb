# README - Ambiente Docker com Node.js, Chrome e Xvfb

## Visão Geral

Este projeto apresenta um ambiente Docker baseado na imagem oficial `node:latest` que instala as dependências essenciais para rodar o navegador Google Chrome em modo gráfico virtual via **Xvfb** (X virtual framebuffer).  

Ideal para executar aplicações Node.js que usam navegadores em modo não-headless (ex: Puppeteer com interface gráfica) em ambientes sem display físico, como containers.

---

## Dockerfile Resumo

O Dockerfile executa os seguintes passos principais:

- Atualiza o sistema e instala bibliotecas necessárias para rodar o Chrome e Xvfb, como libs gráficas, fontes e ferramentas básicas.
- Instala o **Xvfb**, um servidor X virtual que cria um display gráfico em memória.
- Configura o repositório oficial do Google Chrome e instala a versão estável do navegador.

---

## Por que usar Xvfb?

- O Chrome, quando executado em modo `headless: false` ou para automações que requerem interface gráfica, precisa de um servidor X para funcionar.
- Em containers Docker, normalmente não existe um servidor gráfico real.
- O Xvfb simula um servidor X virtual em memória, permitindo que o Chrome funcione sem precisar de hardware gráfico.

---

## Como usar este Dockerfile

### 1. Prepare seu código Node.js

- Certifique-se de ter seu `package.json` com as dependências necessárias, como Puppeteer e RobotJS.
- Tenha seu arquivo principal, por exemplo `index.js`, que executa sua aplicação.

### 2. Adicione o Dockerfile acima na raiz do projeto

Este Dockerfile instala todas as dependências do sistema para Chrome + Xvfb.

### 3. Execute um comando no container

Exemplo simples para iniciar o Xvfb e depois o Node:

```bash
cd data && sh -c "Xvfb :99 -screen 0 1280x720x24 & export DISPLAY=:99 && node index.js"
```
