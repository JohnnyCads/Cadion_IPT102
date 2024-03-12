using Dapper;
using CadionClassLib.Classes;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;
using static Microsoft.EntityFrameworkCore.DBLoggerCategory.Database;

namespace CadionClassLib.DataBaseContext
{
    public interface IProfileDB
    {
        void NewProfile(IProfile newProfile);
        IEnumerable<IProfile> profileSelect(int? Id);
        IEnumerable<IProfile> profileOptions();
        void UpdateProfile(IProfile profile);
        void DeleteProfile(int Id);
    }
    public class ProfileDB : IProfileDB
    {
        private readonly SqlConnection connection;
        private readonly IConfiguration _config;
        public ProfileDB(IConfiguration config)
        {
            _config = config;
            connection = new SqlConnection(_config.GetConnectionString("Cads"));
        }
        #region -- NameDisplayForSelect --
        public IEnumerable<IProfile> profileOptions()
        {
            var sqlstring = "[dbo].[DisplayProfileOption]";
            return connection.Query<Profile>(sqlstring);
        }
        #endregion

        #region -- ProfileDiplay-DB --
        public IEnumerable<IProfile> profileSelect(int? Id)
        {
            var sqlstring = "[dbo].[DisplayProfile]";
            var parameter = new { Id = Id };
            return connection.Query<Profile>(sqlstring, parameter);
        }
        #endregion

        #region -- NewProfile-DB --
        public void NewProfile(IProfile newProfile)
        {
            var sqlstring = "[dbo].[AddNewProfile]";
            var parameter = new DynamicParameters();
            parameter.Add("@FirstName", newProfile.FirstName, DbType.String, ParameterDirection.Input);
            parameter.Add("@SureName", newProfile.SureName, DbType.String, ParameterDirection.Input);
            parameter.Add("@MiddleInitial", newProfile.MiddleInitial, DbType.String, ParameterDirection.Input);
            parameter.Add("@Email", newProfile.Email, DbType.String, ParameterDirection.Input);
            parameter.Add("@PhoneNumber", newProfile.PhoneNumber, DbType.Int32, ParameterDirection.Input);
            parameter.Add("@Address", newProfile.Address, DbType.String, ParameterDirection.Input);
            parameter.Add("@Hobbies", newProfile.Hobbies, DbType.String, ParameterDirection.Input);
            parameter.Add("@PhotoBase64", newProfile.PhotoBase64, DbType.String, ParameterDirection.Input);
            connection.Execute(sqlstring, parameter, commandType: CommandType.StoredProcedure);
        }
        #endregion

        #region -- UpdateProfile-DB --
        public void UpdateProfile(IProfile updateProfile)
        {
            var sqlstring = "[dbo].[UpdateProfile]";
            var parameter = new DynamicParameters();
            parameter.Add("@Id", updateProfile.Id, DbType.Int32, ParameterDirection.Input);
            parameter.Add("@FirstName", updateProfile.FirstName, DbType.String, ParameterDirection.Input);
            parameter.Add("@SureName", updateProfile.SureName, DbType.String, ParameterDirection.Input);
            parameter.Add("@MiddleInitial", updateProfile.MiddleInitial, DbType.String, ParameterDirection.Input);
            parameter.Add("@Email", updateProfile.Email, DbType.String, ParameterDirection.Input);
            parameter.Add("@PhoneNumber", updateProfile.PhoneNumber, DbType.Int32, ParameterDirection.Input);
            parameter.Add("@Address", updateProfile.Address, DbType.String, ParameterDirection.Input);
            parameter.Add("@Hobbies", updateProfile.Hobbies, DbType.String, ParameterDirection.Input);
            parameter.Add("@PhotoBase64", updateProfile.PhotoBase64, DbType.String, ParameterDirection.Input);
            connection.Execute(sqlstring, parameter, commandType: CommandType.StoredProcedure);
        }
        #endregion

        #region -- DeleteProfile-DB --
        public void DeleteProfile(int Id)
        {
            var sqlstring = "[dbo].[DeleteProfile]";
            var parameter = new { Id = Id };
            connection.Execute(sqlstring, parameter, commandType: CommandType.StoredProcedure);
        }
        #endregion
    }
}

