using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MiniBarber.Web.ViewModels.Employee
{
    public class AddEmployeeViewModel : BaseViewModel
    {
        public AddEmployeeViewModel()
        {
            GenderSelect = new List<SelectListItem>();
            PositionSelect = new List<SelectListItem>();

            // Set Gender select
            GenderSelect.Add(new SelectListItem() { Text = "女", Value = "0" });
            GenderSelect.Add(new SelectListItem() { Text = "男", Value = "1" });

            // Set Position select
            PositionSelect.Add(new SelectListItem() { Text = "助理", Value = "0" });
            PositionSelect.Add(new SelectListItem() { Text = "設計師", Value = "1" });
        }

        public List<SelectListItem> GenderSelect { get; set; }
        public List<SelectListItem> PositionSelect { get; set; }

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
}