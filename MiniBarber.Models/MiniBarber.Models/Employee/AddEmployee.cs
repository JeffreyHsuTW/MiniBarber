using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Models.Employee
{
    public class AddEmployeeRequest
    {
        public int EmployeeId { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string TelHome { get; set; }
        public string TelPhone { get; set; }
        public string TelContact { get; set; }
        public string AddressReg { get; set; }
        public string AddressMalling { get; set; }
        public string Email { get; set; }
        public string PositionId { get; set; }
    }

    public class AddEmployeeResponse
    {

    }
}
