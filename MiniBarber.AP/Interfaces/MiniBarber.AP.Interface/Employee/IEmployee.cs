using MiniBarber.Models;
using MiniBarber.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.AP.Interface.Employee
{
    public interface IEmployee
    {
        ResponseModel<AddEmployeeResponse> AddEmployee(RequestModel<AddEmployeeRequest> requestModel);
    }
}
