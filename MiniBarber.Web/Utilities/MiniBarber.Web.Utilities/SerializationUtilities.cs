using MiniBarber.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Web.Utilities
{
    public class SerializationUtilities
    {
        public static string ConvertObject2Json(Object model)
        {
            #region Contracts

            if (model == null) { throw new ArgumentNullException("model can't be mull."); }

            #endregion

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            js.MaxJsonLength = 10485760;//預設是2097152(約4MB),我把它設成20MB
            string jsonString = js.Serialize(model);

            return jsonString.Replace("{}", "null");
        }

        /// <summary>
        /// 將Json轉成物件
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="str"></param>
        /// <returns></returns>
        public static ResponseModel<T> GetResponse<T>(string str)
        {
            #region Contracts

            if (string.IsNullOrWhiteSpace(str)) { throw new ArgumentNullException("Str can't be mull or empty."); }

            #endregion

            StringReader sr = new StringReader(str);
            JsonSerializer serializer = new JsonSerializer();
            return (ResponseModel<T>)serializer.Deserialize(new JsonTextReader(sr), typeof(ResponseModel<T>));
        }

        public static ResponseModel GetResponse(string str)
        {
            #region Contracts

            if (string.IsNullOrWhiteSpace(str)) { throw new ArgumentNullException("Str can't be mull or empty."); }

            #endregion

            StringReader sr = new StringReader(str);
            JsonSerializer serializer = new JsonSerializer();
            return (ResponseModel)serializer.Deserialize(new JsonTextReader(sr), typeof(ResponseModel));
        }
    }
}
