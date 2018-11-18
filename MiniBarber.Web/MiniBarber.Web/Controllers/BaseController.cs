using MiniBarber.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MiniBarber.Web.Controllers
{
    public class BaseController : Controller
    {
        // Fields
        private BasicData _basicData = new BasicData();

        // Methods
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            _basicData.ActionData = InitailActionData();
            _basicData.UserInfo = InitailUserInfo();

            return base.BeginExecuteCore(callback, state);
        }

        private ActionData InitailActionData()
        {
            ActionData actionData = new ActionData();
            actionData.ControllerName = RouteData.Values["controller"].ToString();
            actionData.ActionName = RouteData.Values["action"].ToString();

            return actionData;
        }

        private UserInfo InitailUserInfo()
        {
            var request = HttpContext.Request;

            UserInfo userInfo = new UserInfo();
            userInfo.Ip = request.UserHostAddress;
            userInfo.SessionId = Session.SessionID;

            return userInfo;
        }

        public BasicData GetBasicData()
        {
            return _basicData;
        }
    }
}