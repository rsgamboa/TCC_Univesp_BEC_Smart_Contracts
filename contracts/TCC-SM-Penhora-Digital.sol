// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title DigitalAssetSeizure
 * @dev Um contrato para gerenciar a penhora de ativos digitais.
 */
contract DigitalAssetSeizure {
    /**
     * @dev Estrutura para representar um ativo digital.
     * @param id: Identificador único para o ativo digital.
     * @param name: Nome do ativo digital.
     * @param hash: Hash do ativo digital para verificação de integridade.
     * @param owner: Endereço do atual proprietário do ativo digital.
     * @param timestamp: Timestamp quando o ativo digital foi criado ou registrado.
     * @param isSeized: Booleano indicando se o ativo digital está penhorado.
     */
    struct DigitalAsset {
        uint256 id;
        string name;
        bytes32 hash;
        address owner;
        uint256 timestamp;
        bool isSeized;
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
     * @param _name O nome do ativo digital.
     * @param _data Os dados do ativo digital que serão usados para gerar o hash.
     * @emit AssetUploaded Emite um evento quando o ativo digital é carregado.
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
     * @param _id O identificador do ativo digital a ser penhorado.
     * @dev Apenas o administrador pode chamar esta função. 
     *      Verifica se o ativo digital existe e se não está penhorado antes de penhorá-lo.
     * @emit AssetSeized Emite um evento quando o ativo digital é penhorado.
     */
    function seizeAsset(uint256 _id) public onlyAdmin {
        require(_id < nextAssetId, "Ativo não existe");
        require(!digitalAssets[_id].isSeized, "Ativo já está penhorado");
        digitalAssets[_id].isSeized = true;
        emit AssetSeized(_id, msg.sender);
    }

    /**
     * @param _id O identificador do ativo digital a ser liberado.
     * @dev Apenas o administrador pode chamar esta função. 
     *      Verifica se o ativo digital existe e se está penhorado antes de liberá-lo.
     * @emit AssetReleased Emite um evento quando o ativo digital é liberado.
     */
    function releaseAsset(uint256 _id) public onlyAdmin {
        require(_id < nextAssetId, "Ativo não existe");
        require(digitalAssets[_id].isSeized, "Ativo não está penhorado");
        digitalAssets[_id].isSeized = false;
        emit AssetReleased(_id, msg.sender);
    }

    /**
     * @dev Retorna todos os ativos digitais do contrato.
     * @return Um array de structs DigitalAsset representando todos os ativos digitais.
     */
    function getAssets() public view returns (DigitalAsset[] memory) {
        return digitalAssets;
    }
}
