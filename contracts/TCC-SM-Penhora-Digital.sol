// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title DigitalAssetSeizure
 * @dev Contrato para gerenciar a penhora de ativos digitais.
 */
contract DigitalAssetSeizure {
    /**
     * @dev Estrutura para representar um ativo digital.
     */
    struct DigitalAsset {
        uint256 id;         // Identificador único do ativo digital
        string name;        // Nome do ativo digital
        bytes32 hash;       // Hash do ativo digital para verificação de integridade
        address owner;      // Endereço do proprietário atual do ativo digital
        uint256 timestamp;  // Timestamp de criação ou registro do ativo digital
        bool isSeized;      // Indica se o ativo digital está penhorado
    }

    DigitalAsset[] public digitalAssets;
    uint256 public nextAssetId;
    address public admin;

    event AssetUploaded(uint256 id, string name, bytes32 hash, address owner, uint256 timestamp);
    event AssetSeized(uint256 id, address seizedBy);
    event AssetReleased(uint256 id, address releasedBy);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Somente o administrador pode realizar esta ação");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    /**
     * @dev Faz o upload de um novo ativo digital.
     * @param _name Nome do ativo digital.
     * @param _data Dados do ativo digital para gerar o hash.
     */
    function uploadAsset(string memory _name, string memory _data) public {
        bytes32 hash = keccak256(abi.encodePacked(_data)); // Gera o hash do ativo digital
        digitalAssets.push(DigitalAsset({
            id: nextAssetId,
            name: _name,
            hash: hash,
            owner: msg.sender,
            timestamp: block.timestamp,
            isSeized: false
        }));
        emit AssetUploaded(nextAssetId, _name, hash, msg.sender, block.timestamp);
        nextAssetId++;
    }

    /**
     * @dev Penhora um ativo digital.
     * @param _id Identificador do ativo digital a ser penhorado.
     */
    function seizeAsset(uint256 _id) public onlyAdmin {
        require(_id < nextAssetId, "Ativo não existe");
        require(!digitalAssets[_id].isSeized, "Ativo já está penhorado");
        digitalAssets[_id].isSeized = true;
        emit AssetSeized(_id, msg.sender);
    }

    /**
     * @dev Libera um ativo digital penhorado.
     * @param _id Identificador do ativo digital a ser liberado.
     */
    function releaseAsset(uint256 _id) public onlyAdmin {
        require(_id < nextAssetId, "Ativo não existe");
        require(digitalAssets[_id].isSeized, "Ativo não está penhorado");
        digitalAssets[_id].isSeized = false;
        emit AssetReleased(_id, msg.sender);
    }

    /**
     * @dev Retorna todos os ativos digitais do contrato.
     * @return Array de structs DigitalAsset representando todos os ativos digitais.
     */
    function getAssets() public view returns (DigitalAsset[] memory) {
        return digitalAssets;
    }
}
