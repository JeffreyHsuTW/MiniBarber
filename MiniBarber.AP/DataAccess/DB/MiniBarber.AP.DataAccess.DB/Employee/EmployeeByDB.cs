using Dapper;
using MiniBarber.AP.DataAccess.DB.Employee.Models;
using MiniBarber.AP.Interface.Employee;
using MiniBarber.Models;
using MiniBarber.Models.Employee;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniBarber.AP.DataAccess.DB.Employee
{
    public class EmployeeByDB : IEmployee
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MiniBarberDB"].ToString();

        public ResponseModel<AddEmployeeResponse> AddEmployee(RequestModel<AddEmployeeRequest> requestModel)
        {
            #region Contract

            if (requestModel == null) { throw new ArgumentNullException($"{nameof(requestModel)} can't be null."); }

            #endregion

            ResponseModel<AddEmployeeResponse> responseModel = new ResponseModel<AddEmployeeResponse>();
            AddEmployeeResponse content = new AddEmployeeResponse();

            EmployeeDbModel dbModel = new EmployeeDbModel();
            dbModel.Employee_Id = requestModel.Content.EmployeeId;
            dbModel.Employee_Name = requestModel.Content.Name;
            dbModel.Gender = requestModel.Content.Gender;
            dbModel.Tel_Home = requestModel.Content.TelHome;
            dbModel.Tel_Phone = requestModel.Content.TelPhone;
            dbModel.Tel_Contact = requestModel.Content.TelContact;
            dbModel.Address_Resident = requestModel.Content.AddressReg;
            dbModel.Address_Mailing = requestModel.Content.AddressMalling;
            dbModel.Email = requestModel.Content.Email;
            dbModel.Position_Id = int.Parse(requestModel.Content.PositionId);
            dbModel.IsDel = false;
            dbModel.CreateTime = DateTime.Now;
            dbModel.CreateUser = "";
            dbModel.UpdateTime = dbModel.CreateTime;
            dbModel.UpdateUser = "";

            string sql = @" INSERT INTO Employee (
                                Employee_Id, Employee_Name, Gender, Tel_Home, Tel_Phone, Tel_Contact, 
                                Address_Resident, Address_Mailing, Email, Position_Id, IsDel, 
                                CreateTime, CreateUser) 
                            VALUES (
                                @Employee_Id, @Employee_Name, @Gender, @Tel_Home, @Tel_Phone, @Tel_Contact, 
                                @Address_Resident, @Address_Mailing, @Email, @Position_Id, @IsDel, 
                                @CreateTime, @CreateUser) ";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                var affectedRows = conn.Execute(sql, dbModel);

                responseModel.IsSuccess = affectedRows > 0 ? true : false;
                responseModel.Content = content;
            }

            return responseModel;
        }
    }
}
