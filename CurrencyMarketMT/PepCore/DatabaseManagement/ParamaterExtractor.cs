using Newtonsoft.Json.Linq;
using PepCore.DatabaseManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PepCore.DatabaseManagement
{
    public abstract class ParamaterExtractor : IParamaterExtractor
    {
        public abstract override IEnumerable<SqlParameter> ExtractSQLParameters(JObject objects);

        protected SqlParameter CreateParameter(string parameterName, 
            SqlDbType paramType, object paramValue)
        {
            return new SqlParameter
            {
                ParameterName = parameterName,
                Value = paramValue,
                SqlDbType = paramType
            };
        }
    }
}
