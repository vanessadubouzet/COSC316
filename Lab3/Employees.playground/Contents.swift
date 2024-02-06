import UIKit

class Employee {
    var EmployeeName: String
    var EmployeeID: String
    var JobTitle: String
    var YearsOfService: Int
    
    init(Name: String, ID: String, JobTitle: String, YearsOfService: Int) {
        self.EmployeeName = Name
        self.EmployeeID = ID
        self.JobTitle = JobTitle
        self.YearsOfService = YearsOfService
    }
    
    func pay() -> Double {
        return 100.00
    }
    
    func toString() -> String {
        return "Name: \(EmployeeName)\n ID: \(EmployeeID)\n Title: \(JobTitle)\n Years of Service: \(YearsOfService)"
    }
}

class Volunteer : Employee{
    var reimbursment: Double = 100.00;
    
    override func toString() -> String {
        return "Name: \(EmployeeName)\n ID: \(EmployeeID)\n Title: \(JobTitle)\n Years of Service: \(YearsOfService)\n Reimburstment amount $\(reimbursment)\n Thank you for your volunteer work and time!"
    }
}

var emp1 = Volunteer(Name: "Peter Long", ID: "112-22-3011", JobTitle: "Volunteer Worker", YearsOfService: 5)
print(emp1.toString())
print("---------------------------------------------------------")
