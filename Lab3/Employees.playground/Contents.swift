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

class HourlyEmployee: Employee {
    var hourlyrate: Double
    var hoursworked: Double
    
    init(Name: String, ID: String, JobTitle: String, YearsOfService: Int, HourlyRate: Double, HoursWorked: Double) {
        self.hourlyrate = HourlyRate
        self.hoursworked = HoursWorked
        super.init(Name: Name, ID: ID, JobTitle: JobTitle, YearsOfService: YearsOfService)
    }
    
    override func pay() -> Double {
        var payCheck: Double = 0.0
        if hoursworked <= 80 {
            payCheck = hourlyrate * hoursworked
        } else if hoursworked > 80 {
            payCheck = (hourlyrate * 80.0 + hourlyrate * (hoursworked - 80.0) * 1.5)
        }
        return payCheck
    }
    
    override func toString() -> String {
        return super.toString() + "\n Hourly Rate: $\(hourlyrate)\n Hours Worked: \(hoursworked)\n Paycheck Amount: $\(pay())"
    }
}

var emp3 = HourlyEmployee(Name:"Susan Johnson", ID:"123-32-3515", JobTitle:"Receptionist", YearsOfService:10, HourlyRate: 16, HoursWorked: 84)
print(emp3.toString())
print("-------------------------------------------------------")

var emp4 = HourlyEmployee(Name:"Paul Simon", ID:"133-53-4019", JobTitle:"System Support Analyst", YearsOfService:4, HourlyRate: 22.0, HoursWorked: 75)
print(emp4.toString())
print("-------------------------------------------------------")

class Executive: SalaryEmployee {
    var bonus: Double
    override init(Name: String, ID: String, JobTitle: String, YearsOfService: Int, AnnualSalary: Double) {
        self.bonus = 0
        super.init(Name: Name, ID: ID, JobTitle: JobTitle, YearsOfService: YearsOfService, AnnualSalary: AnnualSalary)
    }
    
    override func pay() -> Double {
        return bonus + super.pay()
    }
    
    override func toString() -> String {
        return super.toString() + "\n Paycheck Amount: $\(pay()) \n Bonus Awarded: $\(bonus)"
    }
}

var emp5 = Executive(Name: "Steve Job", ID: "111-22-3333", JobTitle: "CEO", YearsOfService: 25, AnnualSalary: 1000000.0)
print (emp5.toString())
print ("\n----------------------------------------------------")
print ("3% bonus to be awarded for this paycheck:\n")
emp5.bonus = emp5.pay() * 0.03
print (emp5.toString())
emp5.bonus = 0.0
print ("-------------------------------------------------------")

print("\n 5. POLYMORPHIC REF ------------------- \n ")

var employees: [Employee] = [emp1, emp2, emp3, emp4, emp5]

for emp in employees {
    print (emp.toString())
    print ("---------------------------")
    if let executive = emp as? Executive {
        print ("3% bonus to be awarded for this paycheck:\n")
        emp5.bonus = emp5.pay() * 0.03
        print (emp.toString())
        emp5.bonus = 0.0
        print ("---------------------------")
    }
}

print("\n 6. DICTIONARY ------------------- \n ")

var employeesDictionary: [String: Employee] = [
    emp1.EmployeeID: emp1,
    emp2.EmployeeID: emp2,
    emp3.EmployeeID: emp3,
    emp4.EmployeeID: emp4,
    emp5.EmployeeID: emp5
]

for (empID, emp) in employeesDictionary {
    print (emp.toString())
    print ("---------------------------")
    if let executive = emp as? Executive {
        print ("3% bonus to be awarded for this paycheck:\n")
        emp5.bonus = emp5.pay() * 0.03
        print (emp.toString())
        print ("---------------------------")
    }
}
