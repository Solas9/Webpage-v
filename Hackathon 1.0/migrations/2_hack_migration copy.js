const hack = artifacts.require("hack");

module.exports = function (deployer) {
  deployer.deploy(hack);
};
