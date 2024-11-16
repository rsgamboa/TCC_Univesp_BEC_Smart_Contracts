const DigitalAttachmentManager = artifacts.require("DigitalAttachmentManager");

contract("DigitalAttachmentManager", accounts => {
  // Teste para verificar se um anexo pode ser carregado corretamente
  it("should upload an attachment", async () => {
    const instance = await DigitalAttachmentManager.deployed();
    await instance.uploadAttachment("Test Attachment", "QmHash", { from: accounts[0] });
    const attachment = await instance.getAttachment(0);
    assert.equal(attachment.name, "Test Attachment");
    assert.equal(attachment.hash, "QmHash");
    assert.equal(attachment.uploader, accounts[0]);
  });

  // Teste para verificar se um anexo pode ser apreendido corretamente
  it("should seize an attachment", async () => {
    const instance = await DigitalAttachmentManager.deployed();
    await instance.seizeAttachment(0, { from: accounts[0] });
    const attachment = await instance.getAttachment(0);
    assert.equal(attachment.isSeized, true);
  });

  // Teste para verificar se um anexo pode ser liberado corretamente
  it("should release an attachment", async () => {
    const instance = await DigitalAttachmentManager.deployed();
    await instance.releaseAttachment(0, { from: accounts[0] });
    const attachment = await instance.getAttachment(0);
    assert.equal(attachment.isSeized, false);
  });
});