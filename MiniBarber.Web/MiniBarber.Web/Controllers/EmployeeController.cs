using MiniBarber.Web.ViewModels.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MiniBarber.Web.Controllers
{
    public class EmployeeController : Controller
    {
        public ActionResult Employees()
        {
            EmployeesViewModel viewModel = new EmployeesViewModel();

            return View(viewModel);
        }
    }
}