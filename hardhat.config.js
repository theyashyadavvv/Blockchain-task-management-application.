/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    hardhat: {},
    volta: {
      url: "https://volta-rpc.energyweb.org/",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};
