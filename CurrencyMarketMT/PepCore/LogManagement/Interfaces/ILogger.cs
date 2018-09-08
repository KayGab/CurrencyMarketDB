using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PepCore.LogManagement
{
    public interface ILogger
    {
        void Failure(Exception exception, string context);
        void Info(string information);
    }
}
