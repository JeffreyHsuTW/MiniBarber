using MiniBarber.Models;
using MiniBarber.Models.Employee;
using MiniBarber.Services.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace MiniBarber.Web.Logics.Employee
{
    public class EmployeeByApi : IEmployee
    {
        // Fields
        private string _apiUriString;

        // Constructors
        public EmployeeByApi()
        {
            _apiUriString = ConfigurationManager.AppSettings["ApUri"];
        }

        // Methods
        public ResponseModel<AddEmployeeResponse> AddEmployee(BasicData basicData, AddEmployeeRequest data)
        {
            #region Contract

            if (basicData == null) { throw new ArgumentNullException($"{nameof(basicData)} can't be null."); }
            if (data == null) { throw new ArgumentNullException($"{nameof(data)} can't be null."); }

            #endregion

            RequestModel<AddEmployeeRequest> requestModel = new RequestModel<AddEmployeeRequest>();
            requestModel.BasicData = basicData;
            requestModel.Content = data;

            Uri uri = new Uri($@"{_apiUriString}{basicData.ActionData.ControllerName}/{nameof(AddEmployee)}");
            ResponseModel<AddEmployeeResponse> result = ApiService.CallWebServiceByWebRequest<AddEmployeeRequest, AddEmployeeResponse>(uri, requestModel);

            return result;
        }
    }
}