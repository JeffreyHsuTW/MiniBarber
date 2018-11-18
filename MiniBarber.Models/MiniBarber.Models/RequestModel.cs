using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.Models
{
    [DataContract]
    public class RequestModel
    {
        // Constructors
        public RequestModel()
        {
            TxnSeq = Guid.NewGuid();
        }


        // Properties
        [DataMember]
        public Guid TxnSeq { get; }

        [DataMember]
        public BasicData BasicData { get; set; }

    }
    
    [DataContract]
    public class RequestModel<T> : RequestModel
    {
        [DataMember]
        public T Content { get; set; }
    }
}
