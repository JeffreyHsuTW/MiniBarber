using MiniBarber.AP.Utilities.Log;
using MiniBarber.Models;
using MiniBarber.Models.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MiniBarber.AP.Controllers
{
    public class LogController : ApiController
    {
        [HttpPost]
        public ResponseModel<bool> LogActionInfo(RequestModel<ActionLog> request)
        {
            MiniBarberAPServerLogger.Instance.LogActionInfoLog(request.Content);
            return new ResponseModel<bool>
            {
                IsSuccess = true,
                ErrorMsg = "",
            };
        }

        [HttpPost]
        public ResponseModel<bool> LogPageBrowsedInfo(RequestModel<ActionLog> request)
        {
            MiniBarberAPServerLogger.Instance.LogPageBrowsedInfo(request.Content);
            return new ResponseModel<bool>
            {
                IsSuccess = true,
                ErrorMsg = "",
            };
        }

        [HttpPost]
        public ResponseModel<bool> LogSystemErrorInfo(RequestModel<SystemErrorLog> request)
        {
            MiniBarberAPServerLogger.Instance.LogSystemErrorLog(request.Content);
            return new ResponseModel<bool>
            {
                IsSuccess = true,
                ErrorMsg = "",
            };
        }
    }
}
