using MiniBarber.Web.Logics.Employee;
using MiniBarber.Web.ViewModels.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MiniBarber.Web.Controllers.Employee
{
    public class EmployeeController : BaseController
    {
        [HttpGet]
        public ActionResult Employees()
        {
            EmployeesViewModel viewModel = new EmployeesViewModel();

            return View(viewModel);
        }

        [HttpGet]
        public ActionResult AddEmployee()
        {
            AddEmployeeViewModel viewModel = new AddEmployeeViewModel();

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult AddEmployee(AddEmployeeViewModel inputData)
        {
            try
            {
                AddEmployeeViewModel viewModel = EmployeeContext.Current.AddEmployee(GetBasicData(), inputData);

                if (!viewModel.Result)
                    return View(viewModel);

                return RedirectToAction("Employees", "Employee");
            }
            catch (Exception ex)
            {
                return View();
            }
        }
    }
}