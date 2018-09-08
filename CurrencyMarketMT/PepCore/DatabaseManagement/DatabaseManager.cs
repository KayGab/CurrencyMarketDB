﻿using PepCore.DatabaseManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PepCore.LogManagement;
using PepCore.Model;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json.Linq;
using PepCore.PepConversion;
using System.Data.Common;

namespace PepCore.DatabaseManagement
{
    public class DatabaseManager : IDatabaseManager
    {
        public DatabaseManager(ILogger iLogger, IConnectionManager iconnectionManager,
            IDatabaseExecutor iDatabaseExecutor, IParamaterExtractor iParameterExtractor)
              : base(iLogger, iconnectionManager, iDatabaseExecutor, iParameterExtractor) { }

        public async override Task<PepTable> GetDataAsync(string connectionStringName,
            string procedureName, JObject parameters)
        {
            DbConnection connection = null;
            SqlDataReader readerResponse = null;
            PepTable table = new PepTable();
            try
            {
                connection = this.GetConnection(connectionStringName);
                var dbParams = new DBParameter
                {
                    DBConnection = connection,
                    ProcedureName = procedureName,
                    SqlParameters = this.iParameterExtractor.ExtractSQLParameters(parameters)
                };

                readerResponse = await this.iDatabaseExecutor.ExecuteAsync(dbParams).ConfigureAwait(false);
                table = PepMaker.MakeTableFromReader(readerResponse);
            }
            catch (Exception ex)
            {
                table.Errors = new List<string>{ ex.ToString()};
                iLogger.Failure(ex, "");
            }
            finally
            {
                try
                {
                    if (!readerResponse.IsClosed)
                    {
                        readerResponse.Close();
                    }
                }
                catch (Exception) { }

                try
                {
                    if (connection.State != ConnectionState.Closed)
                    {
                        connection.Close();
                    }
                }
                catch (Exception)
                {
                }
            }

            return table;
        }
    }
}
