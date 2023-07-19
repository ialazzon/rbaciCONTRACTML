	  // SPDX-License-Identifier: MIT
	  pragma solidity ^0.8.0;
	
	  import "@openzeppelin/contracts/access/AccessControl.sol";

      contract HomeworkGrading is AccessControl {
		address public owner;

			
		string public comments;
		
        bytes32 public constant hWEvaluator_ROLE = keccak256("hWEvaluator_ROLE");

        address public grader1Address;
        address public grader2Address;

        modifier onlyGrader1{
          require(msg.sender == grader1Address);
          _;
        }

        constructor(address grader1,address grader2){
			// Grant the contract deployer the default admin role: it will be able
        	// to grant and revoke any roles
			owner = msg.sender;
        	_setupRole(DEFAULT_ADMIN_ROLE, owner);

			grader1Address = grader1;

			grader2Address = grader2;
			_setupRole(hWEvaluator_ROLE, grader2Address);
		}


        address[] alreadySigned_GradeHW;
        address[] toSign_GradeHW;

		function GradeHW () private {
			// Fill with function body
		}

		function GradeHW_Pending(address hWEvaluator ) public{
			require(hasRole(hWEvaluator_ROLE, hWEvaluator), "Address hWEvaluator does not belong to the required role");
            toSign_GradeHW =[grader1Address, hWEvaluator ];
        }

		function Sign_GradeHW (address signer) public{
            require(msg.sender==signer);
            require(search_toSign_GradeHW(signer) );
            if(!search_alreadySigned_GradeHW(signer))
                alreadySigned_GradeHW.push(signer);
        }

		function Finalize_GradeHW (address signer) public {
            require(msg.sender==signer);
            require(search_toSign_GradeHW(signer) );
            require(are_Equal_GradeHW());
            GradeHW();
        }

        function search_toSign_GradeHW(address signer) private view returns (bool found){
            for (uint i = 0; i < toSign_GradeHW.length; i++) {
                if (toSign_GradeHW[i] == signer) {
                    return true;
                } 
            }   
            return false;
        }

        function search_alreadySigned_GradeHW(address signer) private view returns (bool found){
            for (uint i = 0; i < alreadySigned_GradeHW.length; i++) {
                if (alreadySigned_GradeHW[i] == signer) {
                    return true;
                } 
            }   
            return false;
        }

        function are_Equal_GradeHW() private view returns (bool equal){
            if (alreadySigned_GradeHW.length != toSign_GradeHW.length) {
                return false;
            }
            for (uint i = 0; i < toSign_GradeHW.length; i++) {
                if (!search_alreadySigned_GradeHW(toSign_GradeHW[i])) {
                    return false;
                } 
            } 
            return true;
        }		
      }
