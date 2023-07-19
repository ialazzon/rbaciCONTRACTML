	  // SPDX-License-Identifier: MIT
	  pragma solidity ^0.8.0;
	
	  import "@openzeppelin/contracts/access/AccessControl.sol";

      contract HomeworkGrading is AccessControl {
		address public owner;	
		string public comments;
        address public grader1Address;

        modifier onlyGrader1{
          require(msg.sender == grader1Address);
          _;
        }

        constructor(address grader1){
			// Grant the contract deployer the default admin role: it will be able
        	// to grant and revoke any roles
			owner = msg.sender;
        	_setupRole(DEFAULT_ADMIN_ROLE, owner);
			grader1Address = grader1;
		}


        function GradeHW () public onlyGrader1  {
	        // Check that the calling account has the right role
	        
        }
      }
