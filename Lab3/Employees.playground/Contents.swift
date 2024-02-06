import UIKit

class Employee {
    var EmployeeName: String
    var EmployeeID: String
    var JobTitle: String
    var YearsOfService: String
    
    init(Name: String, ID: String, JobTitle: String, YearsOfService: String) {
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
