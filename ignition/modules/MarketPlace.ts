// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MarketPlaceModule = buildModule("CrowdFundingModule", (m) => {

  const marketPlaceModule = m.contract("MarketPlace", );

  return {  marketPlaceModule};
});

export default MarketPlaceModule;