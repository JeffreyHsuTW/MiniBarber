using MiniBarber.AP.DataAccess.DB.Employee;
using MiniBarber.AP.Interface.Employee;
using MiniBarber.Models;
using MiniBarber.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.AP.Logics.Employee
{
    public class EmployeeContext
    {
        // Fields
        IEmployee _employeeDB;


        #region Singleton

        private static readonly Lazy<EmployeeContext> _lazy = new Lazy<EmployeeContext>(() => new EmployeeContext());

        private EmployeeContext()
        {
            _employeeDB = new EmployeeByDB();
        }

        public static EmployeeContext Current { get { return _lazy.Value; } }

        #endregion


        // Methods
        public ResponseModel<AddEmployeeResponse> AddEmployee(RequestModel<AddEmployeeRequest> requestModel)
        {
            ResponseModel<AddEmployeeResponse> responseModel = new ResponseModel<AddEmployeeResponse>();
            responseModel.ReturnCode = "200";

            var response = _employeeDB.AddEmployee(requestModel);

            if (!response.IsSuccess)
            {
                responseModel.ReturnCode = response.ReturnCode;
                responseModel.ErrorMsg = response.ErrorMsg;
            }

            responseModel.Content = response.Content;

            return responseModel;
        }
    }
}
