// Conectar ao Web3
if (typeof window.ethereum !== 'undefined') {
    window.web3 = new Web3(window.ethereum);
    window.ethereum.enable();
} else {
    console.log('MetaMask não está instalado!');
}

// Endereço do contrato implantado
const contractAddress = 'ENDEREÇO_DO_CONTRATO_IMPLANTADO';

// ABI do contrato
const contractABI = [
    // ABI gerada pelo compilador Solidity
    // Copie e cole a ABI gerada pelo Truffle ou Hardhat aqui
];

// Instanciar o contrato
const contract = new web3.eth.Contract(contractABI, contractAddress);

// Função para fazer upload de um ativo digital
async function uploadAsset() {
    const accounts = await web3.eth.getAccounts();
    const account = accounts[0];
    const name = "Ativo 1";
    const data = "dados do ativo 1";
    await contract.methods.uploadAsset(name, data).send({ from: account });
    console.log('Ativo carregado com sucesso!');
}

// Função para penhorar um ativo digital
async function seizeAsset() {
    const accounts = await web3.eth.getAccounts();
    const account = accounts[0];
    const assetId = 0; // ID do ativo a ser penhorado
    await contract.methods.seizeAsset(assetId).send({ from: account });
    console.log('Ativo penhorado com sucesso!');
}

// Função para liberar um ativo digital
async function releaseAsset() {
    const accounts = await web3.eth.getAccounts();
    const account = accounts[0];
    const assetId = 0; // ID do ativo a ser liberado
    await contract.methods.releaseAsset(assetId).send({ from: account });
    console.log('Ativo liberado com sucesso!');
}

// Função para obter todos os ativos digitais
async function getAssets() {
    const assets = await contract.methods.getAssets().call();
    console.log(assets);
}