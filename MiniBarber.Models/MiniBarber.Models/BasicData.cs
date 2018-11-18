using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Models
{
    public class BasicData
    {
        // Constructors
        public BasicData()
        {
            TxnSeq = new Guid();
        }

        [DataMember]
        public Guid TxnSeq { get; set; }

        [DataMember]
        public ActionData ActionData { get; set; }

        [DataMember]
        public UserInfo UserInfo { get; set; }
    }

    public class ActionData
    {
        [DataMember]
        public string ControllerName { get; set; }

        [DataMember]
        public string ActionName { get; set; }

        [DataMember]
        public string ViewName { get; set; }
    }

    public class UserInfo
    {
        [DataMember]
        public string Ip { get; set; }

        [DataMember]
        public string SessionId { get; set; }
    }
}
