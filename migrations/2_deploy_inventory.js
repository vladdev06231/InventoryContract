const Inventory = artifacts.require("Inventory");

module.exports = async function (deployer) {

    await deployer.deploy(
      Inventory,
      "https://team3d.io/inventory/json/", // Prefix of token URI
      ".json", // Back of token URI
      "0x3D3D35bb9bEC23b06Ca00fe472b50E7A4c692C30" // Reward Token Address(Vidya)
    );

    return;
};
