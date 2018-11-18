using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.AP.DataAccess.DB.Employee.Models
{
    public class EmployeeDbModel
    {
        public int Employee_Id { get; set; }
        public string Employee_Name { get; set; }
        public string Gender { get; set; }
        public string Tel_Home { get; set; }
        public string Tel_Phone { get; set; }
        public string Tel_Contact { get; set; }
        public string Address_Resident { get; set; }
        public string Address_Mailing { get; set; }
        public string Email { get; set; }
        public int Position_Id { get; set; }
        public bool IsDel { get; set; }
        public DateTime CreateTime { get; set; }
        public string CreateUser { get; set; }
        public DateTime UpdateTime { get; set; }
        public string UpdateUser { get; set; }
    }
}
