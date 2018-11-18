using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Models
{
    [DataContract]
    public class ResponseModel
    {
        [DataMember]
        public bool IsSuccess { get; set; }

        [DataMember]
        public Guid TxnSeq { get; set; }

        [DataMember]
        public string ReturnCode { get; set; }

        [DataMember]
        public string ErrorMsg { get; set; }
    }

    [DataContract]
    public class ResponseModel<T> : ResponseModel
    {
        public T Content { get; set; }
    }
}
