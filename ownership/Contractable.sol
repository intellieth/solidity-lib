pragma solidity ^0.4.11;

import './Ownable.sol';

/**
 * @title Contractable token
 * @dev Basic version of a contractable contract, allowing the set of contracts to call onlyContract methods
 * contact information.
 */
contract Contractable is Ownable{

    mapping (address => bool) contracts;

    function Contractable() {
    	contracts[owner] = true;
    }

    /**
     * @dev Allows the owner to set a contract which can call methods
     * @param addr The contact address to attach to the contract.
     * @param status status of contract address.
     */
    function setContract(address addr , bool status) onlyOwner public {
         contracts[addr] = status;
    }

    /**
     * @dev Allows the owner to set a contract which can call methods
     * @param addr The contact address to attach to the contract.
     */
    function getContract(address addr) public constant returns (bool) {
         return contracts[addr];
    }

    /**
	* @dev Throws if called by any account other than the contracts.
	*/
	modifier onlyContract() {
		require(contracts[msg.sender] == true);
		_;
	}
}
