using MiniBarber.Models;
using MiniBarber.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Web.Logics.Employee
{
    public interface IEmployee
    {
        ResponseModel<AddEmployeeResponse> AddEmployee(BasicData basicData, AddEmployeeRequest data);
    }
}
