	  // SPDX-License-Identifier: MIT
	  pragma solidity ^0.8.0;
	
	  import "@openzeppelin/contracts/access/AccessControl.sol";

      contract HomeworkGrading is AccessControl {
		address public owner;
			
		string public comments;
        address public grader1Address;
        address public grader2Address;

        constructor(address grader1,address grader2){
			// Grant the contract deployer the default admin role: it will be able
        	// to grant and revoke any roles
			owner = msg.sender;
        	_setupRole(DEFAULT_ADMIN_ROLE, owner);
			grader1Address = grader1;

			grader2Address = grader2;
		}


        function GradeHW () public  {
	        // Check that the calling account has the right role
	        
			  require (msg.sender == grader1Address||msg.sender == grader2Address);
        }

      }