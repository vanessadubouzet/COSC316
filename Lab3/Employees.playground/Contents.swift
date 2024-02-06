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

class Volunteer: Employee{
    var reimbursment: Double = 100.00;
    
    override func toString() -> String {
        return super.toString() + "\n Reimburstment amount: $\(reimbursment)\n Thank you for your volunteer work and time!"
    }
}

var emp1 = Volunteer(Name: "Peter Long", ID: "112-22-3011", JobTitle: "Volunteer Worker", YearsOfService: 5)
print(emp1.toString())
print("---------------------------------------------------------")

class SalaryEmployee: Employee {
    var annualsalary: Double
    
    init(Name: String, ID: String, JobTitle: String, YearsOfService: Int, AnnualSalary: Double) {
        self.annualsalary = AnnualSalary
        super.init(Name: Name, ID: ID, JobTitle: JobTitle, YearsOfService: YearsOfService)
    }
    
    override func pay() -> Double {
        var payCheck = annualsalary / 26.0
        return round(payCheck)
    }
    
    override func toString() -> String {
        return super.toString() + "\n Annual Salary: $\(annualsalary) \n Paycheck Amount: $\(pay())"
    }
}

var emp2 = SalaryEmployee(Name:"Martine Short", ID:"116-23-6418", JobTitle:"Manager",YearsOfService:8, AnnualSalary: 78600.00)
print (emp2.toString())
print("---------------------------------------------------------")
