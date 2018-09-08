using PepCore.DatabaseManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using System.Data.SqlClient;
using System.Data;

namespace PepCore.DatabaseManagement
{
    public class MembersParameterExtractor : ParamaterExtractor
    {
        public override IEnumerable<SqlParameter> ExtractSQLParameters(JObject objects)
        {
            if (objects == null || objects.Count == 0)
                return new List<SqlParameter>();

            return new List<SqlParameter>()
            {
                CreateParameter("MemberName", SqlDbType.NVarChar, objects["MemberName"])
            };
        }
    }
}
