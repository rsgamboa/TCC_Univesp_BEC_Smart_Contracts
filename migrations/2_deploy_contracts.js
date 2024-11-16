const DigitalAttachmentManager = artifacts.require("DigitalAttachmentManager");

module.exports = function(deployer) {
  deployer.deploy(DigitalAttachmentManager);
};