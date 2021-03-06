pragma solidity ^0.4.17;
// import "github.com/Arachnid/solidity-stringutils/strings.sol";
// contract PollFactory111111{

//     event PollCreated1111(address pollAddress);
    
//     address[] deployedPolls;
//     address public latestPoll;
//     function createPoll(string question) public {
//         latestPoll = new Poll(question);
//         deployedPolls.push(latestPoll);
//         emit PollCreated(latestPoll);
//     }
    
//     function getDeployedPolls() public view returns(address[]){
//         return deployedPolls;
//     }

// }

contract Hospital{
    struct Option{
        string name;
        Examination[] examinations;
    }

    event ExaminationCreated(address examinAddress);
    event PatientCreated(address patientAddress);

    address public examinatorHospital;
    address public patient;
    address[] deployedExaminatorHospitals;
    address[] deployedPatientHospitals;

    function createExamination() public {
        examinatorHospital = new Examination();
        deployedExaminatorHospitals.push(examinatorHospital);
        emit ExaminationCreated(examinatorHospital);
    }

    function createPatient(string name, string addr) public {
        patient = new Patient(name, addr);
        deployedPatientHospitals.push(patient);
        emit PatientCreated(patient);
    }

    function getDeployedExaminations() public view returns(address[]){
        return deployedExaminatorHospitals;
    }

    function getDeployedPatients() public view returns(address[]){
        return deployedPatientHospitals;
    }

}

contract Examination{

    struct Option{
        string name;
        string result;
        int cost;
        bool status;
    }
    
    Option[] public options;

    constructor() public {

    }

    function createNewOption(string optName, string optResult, int optCost) public {
        Option memory newOption = Option({
            name:optName,
            result:optResult,
            cost:optCost,
            status:false
        });
        options.push(newOption);
    }

    // function getExamin() public view returns(string, string){
    //     return (
    //         for
    //     );
    // }
    function getExamination(uint index) public view returns(string, string) {
        return(
            options[index].name,
            options[index].result
        );
    }

    // function getAllExamin() public view returns(string) {
    //     string lst;
    //     for (uint i = 0; i < options.length; i++) {
    //         lst += 
    //     }
    // }
}

contract Patient {
    string public name;
    string public addr;

    constructor(string initName, string initAddress) public {
        name = initName;
        addr = initAddress;
    }
    // function getAllPatients() public view returns(string) {
    //     string lst = new string;
    //     string comma = new string(";");
    //     for (uint i = 0; i < lstPatients.length; i++) {
    //         if (i > 0 || i < lstPatients.length){
    //             lst += lst.toSlice().concat(comma.toSlice());
    //         }
    //         lst += lst.toSlice().concat(lstPatients[i].personAddress.toSlice());
    //     }
    //     return (lst);
    // }

}
    
// contract Poll1111{

//     struct  Option {
//         string name;
//         uint votedCount;
//         mapping(address => bool) voters;
//     }

//     string public question;
//     Option[] public options;

//     constructor(string initQuestion) public {
//         question = initQuestion;
//     }

//     function createNewOption(string optionName) public {
//         Option memory newOption = Option({
//             name:optionName,
//             votedCount:0
//         });
//         options.push(newOption);
//     }

//     function vote(uint[] optionsIndexes) public{
//         for (uint i = 0; i < optionsIndexes.length; i++) {
//             uint index = optionsIndexes[i];
//             Option storage option = options[index];
//             require(!option.voters[msg.sender], "The voter already voted.");
//             option.voters[msg.sender] = true;
//             option.votedCount++;
//         }
//     }
//     function getSummary() public view returns(string,uint) {
//         return (
//             question,
//             options.length
//         );
//     }

// }