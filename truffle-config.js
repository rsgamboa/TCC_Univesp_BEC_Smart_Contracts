module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Endereço IP local onde o nó Ethereum está sendo executado
      port: 8545, // Porta na qual o nó Ethereum está ouvindo
      network_id: "*" // Aceita qualquer ID de rede (útil para desenvolvimento)
    }
  },
  compilers: {
    solc: {
      version: "0.8.0" // Versão do compilador Solidity a ser usada
    }
  }
};