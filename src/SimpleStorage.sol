// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 private num;

    // Event that is emitted when num is set
    event NumSet(uint256 indexed num);

    // Event that is emitted when num is retrieved
    event NumRetrieved(uint256 indexed num);

    // Function to set num
    function setNum(uint256 _num) public {
        num = _num;
        emit NumSet(_num);
    }

    // Function to get num
    function getNum() public returns (uint256) {
        emit NumRetrieved(num);
        return num;
    }
}
