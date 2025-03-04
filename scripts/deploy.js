const hre = require("hardhat");

async function main() {
  // Compile contracts before deployment (optional)
  await hre.run("compile");

  // Deploy contract
  const ToDo = await hre.ethers.getContractFactory("ToDo"); // Ensure your contract name is correct
  const todo = await ToDo.deploy(); // Deploying the contract

  await todo.waitForDeployment(); // Correct method instead of `deployed()`

  console.log(`ToDo contract deployed at: ${todo.target}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

