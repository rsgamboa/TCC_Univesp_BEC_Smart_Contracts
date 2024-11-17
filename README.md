# TCC_Univesp_BEC_Smart_Contracts
TCC Univesp Bacharelado Engenharia de Computação

## Descrição
Este projeto faz parte do Trabalho de Conclusão de Curso (TCC) do curso de Bacharelado em Engenharia de Computação da Universidade Virtual do Estado de São Paulo (Univesp). O objetivo é desenvolver um sistema de penhora digital utilizando contratos inteligentes na blockchain Ethereum.

## Importância para Pesquisas Futuras
Este modelo de contrato inteligente é projetado para ser uma base eficaz para futuras pesquisas e desenvolvimentos na área de contratos inteligentes. Ele demonstra como a tecnologia blockchain pode ser aplicada para gerenciar ativos digitais de forma segura e transparente. Pesquisadores e desenvolvedores podem usar este projeto como ponto de partida para explorar novas funcionalidades, melhorar a segurança e eficiência, e adaptar o sistema para diferentes casos de uso.

## Funcionalidades
- **Upload de Ativos Digitais**: Permite o upload de ativos digitais, gerando um hash para verificação de integridade.
- **Penhora de Ativos**: Permite ao administrador penhorar ativos digitais.
- **Liberação de Ativos**: Permite ao administrador liberar ativos digitais penhorados.
- **Consulta de Ativos**: Permite a consulta de todos os ativos digitais armazenados no contrato.

## Tecnologias Utilizadas
- **Solidity**: Linguagem de programação para contratos inteligentes.
- **Truffle**: Framework de desenvolvimento para Ethereum.
- **Web3.js**: Biblioteca JavaScript para interagir com a blockchain Ethereum.
- **Ganache**: Ambiente de desenvolvimento local para Ethereum.

# Estrutura do Projeto

Este projeto está organizado da seguinte forma:

```plaintext
TCC_Univesp_BEC_Smart_Contracts/
├── contracts/
│   └── DigitalAssetSeizure.sol
├── migrations/
│   └── 2_deploy_contracts.js
├── src/
│   ├── app.js
│   └── index.html
├── test/
│   └── DigitalAssetSeizure.test.js
├── truffle-config.js
└── README.md
```

## Instalação e Configuração
### Pré-requisitos
- **Node,js**
- **npm**
- **Truffle**
- **Ganache**


## Passos para Configuração
1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/TCC_Univesp_BEC_Smart_Contracts.git
```

2. **Instale as dependências:**

```bash
npm install
```

3. **Compile os contratos:**

```bash
truffle compile
```

4. **Inicie o Ganache:** Abra o Ganache e inicie um novo workspace
5. **Implate os contratos:**

```bash
truffle migrate
```

6. **Inicie o servidor:** Abra o arquivo `index.html` no seu navegador ou use uma extensão como Live Server no VSCode.

## Uso
### Upload de Ativos Digitais

1. Abra o navegador e vá para a página do projeto.
2. Clique no botão "Upload Asset" e siga as instruções

## Penhora de Ativos

1. Clique no botão "Seize Asset" e siga as instruções

## Liberação de Ativos

1. Clique no botão "Get Assets" para visualizar todos os ativos digitais

## Contribuição

1. Faça um fork do projeto
2. Crie uma nova branch (`git chkout -b feature/nova-funcionalidade`).
3. Commit suas mudanças (`git commit -am 'Adiciona nova funcionabilidade`).
4. Faça um push para a branch(`git push origin feature/nova-funcionabilidade`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.

## Contato

- **Nome:** Rodrigo Sanches Gamboa
- **Linkedin:** https://www.linkedin.com/in/rsgamboa/

#
**Nota:** Este projeto é apenas para fins educacionais e não deve ser usado em produção sem as devidas auditorias de segurança.