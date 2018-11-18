using MiniBarber.AP.Logics.Employee;
using MiniBarber.Models;
using MiniBarber.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniBarber.AP.Controllers.Employee
{
    public class EmployeeController : ApiController
    {
        public ResponseModel<AddEmployeeResponse> AddEmployee(RequestModel<AddEmployeeRequest> requestModel)
        {
            try
            {
                #region Contract

                if (requestModel == null)
                {
                    throw new ArgumentNullException($"{nameof(requestModel)} can't be null.");
                }

                #endregion


                return EmployeeContext.Current.AddEmployee(requestModel);
            }
            catch (Exception ex)
            {
                ResponseModel<AddEmployeeResponse> responseModel = new ResponseModel<AddEmployeeResponse>();
                responseModel.IsSuccess = false;
                responseModel.ErrorMsg = ex.Message;

                return responseModel;
            }
        }
    }
}
