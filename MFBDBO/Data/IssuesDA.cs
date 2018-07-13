using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;


namespace MFBDBO.Data
{
    //public class IssuesDA
    //{
    //    MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);  

    //     public IEnumerable<Issuestbl> IssuesAll(Issuestbl ls)
    //    {
    //        List<Issuestbl> obj = new List<Issuestbl>();
    //        try
    //        {
    //            MySqlCommand cmd = new MySqlCommand("Sp_Issues", con);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            //cmd.Parameters.AddWithValue("type", type);
    //            //MySqlCommand cmd = new MySqlCommand("insert into tblIssues values(@IssuesID, @BookingID, @Status, @Priority,@AssignToEmployee, @Note, @IsActive, @CreatedBy, @CreatedDate, @UpdatedBy, @UpdatedDate)", con);
    //            //IssuesID, BookingID, Status, Priority, AssignToEmployee, Note, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    //            cmd.Parameters.AddWithValue("pIssuesID", ls.IssuesID);
    //            cmd.Parameters.AddWithValue("pBookingID", ls.BookingID);
    //            cmd.Parameters.AddWithValue("pIssue", ls.Issue);
    //            cmd.Parameters.AddWithValue("pStatus", ls.Status);
    //            cmd.Parameters.AddWithValue("pPriority", ls.Priority);
    //            cmd.Parameters.AddWithValue("pAssignToEmployee", ls.AssignToEmployee);
    //            cmd.Parameters.AddWithValue("pNote", ls.Note);
    //            cmd.Parameters.AddWithValue("pIsActive", ls.IsActive);
    //            cmd.Parameters.AddWithValue("pCreatedBy", ls.CreatedBy);
    //            cmd.Parameters.AddWithValue("pCreatedDate", ls.CreatedDate);
    //            cmd.Parameters.AddWithValue("pUpdatedBy", ls.UpdatedBy);
    //            cmd.Parameters.AddWithValue("pUpdatedDate", ls.UpdatedDate);


    //            if (con.State == ConnectionState.Closed)
    //            {
    //                con.Open();
    //            }

    //            MySqlDataReader dr = cmd.ExecuteReader();
    //            while (dr.Read())
    //            {
    //                obj.Add(new Issuestbl
    //                {
    //                    IssuesID = Convert.ToInt32(dr["IssuesID"]),
    //                    BookingID = Convert.ToInt32(dr["BookingID"]),
    //                    Issue= dr["Issue"].ToString(),
    //                    Status = Convert.ToInt32(dr["Status"]),
    //                    Priority = Convert.ToInt32(dr["Priority"]),
    //                    AssignToEmployee = dr["AssignToEmployee"].ToString(),
    //                    Note = dr["Note"].ToString(),
    //                    IsActive = Convert.ToInt32(dr["IsActive"]),
    //                    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
    //                    CreatedDate = dr["CreatedDate"].ToString(),
    //                    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
    //                    UpdatedDate = dr["UpdatedDate"].ToString(),
    //                    Message = "Success",

    //                });
    //            }
    //            dr.Close();

    //        }
    //        catch (Exception ex)
    //        {
    //            obj.Add(new Issuestbl
    //            {
    //                Message = "Error",
    //                ErrorMessage = ex.Message,
    //            });
    //        }
    //        finally
    //        {
    //            con.Close();
    //        }
    //        return obj;
    //    }

    //    public IEnumerable<Issuestbl> GetIssues()
    //    {
    //        List<Issuestbl> obj = new List<Issuestbl>();
    //        try
    //        {
    //            MySqlCommand cmd = new MySqlCommand("Sp_GetIssues", con);
    //            cmd.CommandType = CommandType.StoredProcedure;


    //            if (con.State == ConnectionState.Closed)
    //            {
    //                con.Open();
    //            }

    //            MySqlDataReader dr = cmd.ExecuteReader();
    //            while (dr.Read())
    //            {
    //                obj.Add(new Issuestbl
    //                {
    //                    IssuesID = Convert.ToInt32(dr["IssuesID"]),
    //                    BookingID = Convert.ToInt32(dr["BookingID"]),
    //                    Issue = dr["Issue"].ToString(),
    //                    Status = Convert.ToInt32(dr["Status"]),
    //                    Priority = Convert.ToInt32(dr["Priority"]),
    //                    AssignToEmployee = dr["AssignToEmployee"].ToString(),
    //                    Note = dr["Note"].ToString(),
    //                    IsActive = Convert.ToInt32(dr["IsActive"]),
    //                    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
    //                    CreatedDate = dr["CreatedDate"].ToString(),
    //                    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
    //                    UpdatedDate = dr["UpdatedDate"].ToString(),
    //                    Message = "Success",

    //                });
    //            }
    //            dr.Close();

    //        }
    //        catch (Exception ex)
    //        {
    //            obj.Add(new Issuestbl
    //            {
    //                Message = "Error",
    //                ErrorMessage = ex.Message,
    //            });
    //        }
    //        finally
    //        {
    //            con.Close();
    //        }
    //        return obj;
    //    }
    //}
    public class IssuesDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<Issuestbl> IssuesAll(int type, Issuestbl iss)
        {
            List<Issuestbl> objIssues = new List<Issuestbl>();
            try
            {                

                MySqlCommand cmd = new MySqlCommand("Sp_Issues", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("ptype", type);
                cmd.Parameters.AddWithValue("pIssuesID", iss.IssuesID);
                cmd.Parameters.AddWithValue("pBookingID", iss.BookingID);
                cmd.Parameters.AddWithValue("pIssue", iss.Issue);
                cmd.Parameters.AddWithValue("pStatus", iss.Status);
                cmd.Parameters.AddWithValue("pPriority", iss.Priority);
                cmd.Parameters.AddWithValue("pAssignToEmployee", iss.AssignToEmployee);
                cmd.Parameters.AddWithValue("pNote", iss.Note);
                cmd.Parameters.AddWithValue("pIsActive", iss.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", iss.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", iss.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", iss.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", iss.UpdatedDate);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    objIssues.Add(new Issuestbl
                    {
                        IssuesID = Convert.ToInt32(dr["IssuesID"]),
                        BookingID = string.IsNullOrEmpty(dr["BookingID"].ToString()) ? 0 : Convert.ToInt32(dr["BookingID"]),
                        Issue = dr["Issue"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        Priority = Convert.ToInt32(dr["Priority"]),
                        AssignToEmployee = dr["AssignToEmployee"].ToString(),
                        Note = dr["Note"].ToString(),
                        IsActive =  Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0:Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate =dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate =dr["UpdatedDate"].ToString(),
                       Message = "Success",
                    });
                }
                

            }
            catch(Exception ex)
            {
                objIssues.Add(new Issuestbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objIssues;
        }
    }
    public class Issuestbl
    {
        public int IssuesID { get; set; }

        public int BookingID { get; set; }

        public string Issue { get; set; }

        public int Status { get; set; }

        public int Priority { get; set; }

        public string AssignToEmployee { get; set; }

        public string Note { get; set; }
       
        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }
}

