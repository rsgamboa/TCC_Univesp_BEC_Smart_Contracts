/**
 * Este script é usado para implantar o contrato inteligente DigitalAttachmentManager.
 * O contrato DigitalAttachmentManager é responsável por gerenciar anexos digitais
 * dentro da rede blockchain. Ele lida com a criação, armazenamento e recuperação de
 * anexos digitais, garantindo sua integridade e acessibilidade.
 */
const DigitalAttachmentManager = artifacts.require("DigitalAttachmentManager");

module.exports = function(deployer) {
  deployer.deploy(DigitalAttachmentManager);
};