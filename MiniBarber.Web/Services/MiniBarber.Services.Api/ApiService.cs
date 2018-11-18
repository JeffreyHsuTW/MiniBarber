using MiniBarber.Models;
using MiniBarber.Models.Log;
using MiniBarber.Web.Utilities;
using MiniBarber.Web.Utilities.Log;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Services.Api
{
    public class ApiService
    {
        // Serialize
        public static ResponseModel<TResponse> CallWebServiceByWebRequest<TRequest, TResponse>(Uri uri, RequestModel<TRequest> requestModel)
        {
            string requestString = JsonConvert.SerializeObject(requestModel);

            return LogServiceInfo<TResponse>(uri, requestString, requestModel.BasicData);
        }

        public static ResponseModel<TResponse> CallWebServiceByWebRequest<TResponse>(Uri uri, RequestModel requestModel)
        {
            string requestString = JsonConvert.SerializeObject(requestModel);

            return LogServiceInfo<TResponse>(uri, requestString, requestModel.BasicData);
        }

        public static ResponseModel CallWebServiceByWebRequest<TRequest>(Uri uri, RequestModel<TRequest> requestModel)
        {
            string requestString = JsonConvert.SerializeObject(requestModel);

            return LogServiceInfo(uri, requestString, requestModel.BasicData);
        }

        public static ResponseModel CallWebServiceByWebRequest(Uri uri, RequestModel requestModel)
        {
            string requestString = JsonConvert.SerializeObject(requestModel);

            return LogServiceInfo(uri, requestString, requestModel.BasicData);
        }

        // Log
        private static ResponseModel<TResponse> LogServiceInfo<TResponse>(Uri uri, string requestString, BasicData basicData)
        {
            ResponseModel<TResponse> result = new ResponseModel<TResponse>();

            DateTime startTime = DateTime.Now;
            result = CallWebServiceByWebRequest<TResponse>(uri, requestString, basicData);
            DateTime endTime = DateTime.Now;

            string responseString = JsonConvert.SerializeObject(result);
            ServiceInfo serivceLogInfo = new ServiceInfo(requestString, responseString, startTime, endTime, result.IsSuccess);
            serivceLogInfo.ErrorMessage = result.ErrorMsg;

            MiniBarberLogger.Instance.LogActionInfoLog(basicData, serivceLogInfo);

            return result;
        }

        private static ResponseModel LogServiceInfo(Uri uri, string requestString, BasicData basicData)
        {
            ResponseModel result = new ResponseModel();

            DateTime startTime = DateTime.Now;
            result = CallWebServiceByWebRequest(uri, requestString, basicData);
            DateTime endTime = DateTime.Now;

            string responseString = JsonConvert.SerializeObject(result);
            ServiceInfo serivceLogInfo = new ServiceInfo(requestString, responseString, startTime, endTime, result.IsSuccess);
            serivceLogInfo.ErrorMessage = result.ErrorMsg;

            MiniBarberLogger.Instance.LogActionInfoLog(basicData, serivceLogInfo);

            return result;
        }

        // Call service
        private static ResponseModel<TResponse> CallWebServiceByWebRequest<TResponse>(Uri uri, string requestString, BasicData basicData)
        {
            ResponseModel<TResponse> result = new ResponseModel<TResponse>();

            string responseFromServer = CallWebServiceByWebRequest(uri, basicData, requestString);

            return SerializationUtilities.GetResponse<TResponse>(responseFromServer);
        }

        private static ResponseModel CallWebServiceByWebRequest(Uri uri, string requestString, BasicData basicData)
        {
            ResponseModel result = new ResponseModel();

            string responseFromServer = CallWebServiceByWebRequest(uri, basicData, requestString);

            return SerializationUtilities.GetResponse(responseFromServer);
        }

        private static string CallWebServiceByWebRequest(Uri uri, BasicData basicData, string requestString)
        {
            WebRequest request = WebRequest.Create(uri);
            request.Method = "POST";
            request.ContentType = "application/json";
            byte[] byteArray = Encoding.UTF8.GetBytes(requestString);
            request.ContentLength = byteArray.Length;

            using (Stream requestStream = request.GetRequestStream())
            {
                requestStream.Write(byteArray, 0, byteArray.Length);
            }

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    return reader.ReadToEnd();
                }
            }
        }

        // Compose uri
        public static Uri ComposeApUri(string controllerName, string actionName = "")
        {
            #region Contract

            if (string.IsNullOrWhiteSpace(controllerName)) { throw new ArgumentNullException("Controller name can't be null or empty."); }

            #endregion

            string apUriString = ConfigurationManager.AppSettings["ApUri"];

            if (string.IsNullOrWhiteSpace(actionName))
            {
                StackTrace staciTrace = new StackTrace(true);
                actionName = staciTrace.GetFrame(1).GetMethod().Name;
            }

            return new Uri($@"{apUriString}{controllerName}/{actionName}");
        }
    }
}
