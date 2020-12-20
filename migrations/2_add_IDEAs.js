const IDEAs = artifacts.require("IDEAs");

module.exports = function (deployer) {
    deployer.deploy(IDEAs, 
        "0xdf91a7106e86a6d4f321cc085f9dc6a78d923996",
        "128", 
        "0xe814b9c22e330f610d8e6c0f967385a7f037130d",
        "1000000000000000000"
    ); 
};
