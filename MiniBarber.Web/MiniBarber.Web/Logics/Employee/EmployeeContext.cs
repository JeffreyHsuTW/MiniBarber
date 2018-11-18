using AutoMapper;
using MiniBarber.Models;
using MiniBarber.Models.Employee;
using MiniBarber.Web.ViewModels.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MiniBarber.Web.Logics.Employee
{
    public class EmployeeContext
    {
        // Fields
        IEmployee _employee;


        #region Singleton

        private static readonly Lazy<EmployeeContext> _lazy = new Lazy<EmployeeContext>(() => new EmployeeContext());

        private EmployeeContext()
        {
            _employee = new EmployeeByApi();
        }

        public static EmployeeContext Current { get { return _lazy.Value; } }

        #endregion

        // Methods
        //public AddEmployeeViewModel GetAddEmployeeViewModel()
        //{
        //    AddEmployeeViewModel viewModel = new AddEmployeeViewModel();

        //    return viewModel;
        //}

        public AddEmployeeViewModel AddEmployee(BasicData basicData, AddEmployeeViewModel inputData)
        {
            AddEmployeeRequest requestModel = GetEmployeesRequestModel(inputData);

            var response = _employee.AddEmployee(basicData, requestModel);

            return inputData;
        }

        #region Private Methods

        public AddEmployeeRequest GetEmployeesRequestModel(AddEmployeeViewModel data)
        {
            AddEmployeeRequest requestModel = new AddEmployeeRequest();

            //AutoMapper
            var config = new MapperConfiguration(o => o.CreateMap<AddEmployeeViewModel, AddEmployeeRequest>());
            var mapper = config.CreateMapper();
            requestModel = mapper.Map<AddEmployeeRequest>(data);



            return requestModel;
        }

        #endregion
    }
}