#nullable disable
using CadionCorLib.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using System.Data;
using Dapper;

namespace CadionWebApp.Pages
{

    [BindProperties]
    public class AdminModel : PageModel
    {
        public string Search { get; set; }
        public string Password { get; set; }
        public string Username { get; set; }
        public string Class { get; set; }
        public int Id { get; set; }
        public string Password2 { get; set; }
        public string Username2 { get; set; }
        public string Class2 { get; set; }
        public int Id2 { get; set; }

        private readonly ILogger<AdminModel> _logger;
        private readonly IConfiguration _config;
        public IEnumerable<Users.UserModel> list { get; set; }

        public AdminModel(ILogger<AdminModel> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config;
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.UserModel>("[dbo].[User_DIS]", commandType: CommandType.StoredProcedure);
        }

        public IActionResult OnPostAdd()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionB"));
            con.Query("[dbo].[User_ADD]", new
            {
                @Password = Password,
                @Username = Username,
                @Class = Class
            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostCCedi()
        {

            Password = Password2;
            Username = Username2;
            Class = Class2;
            Id = Id2;
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.UserModel>("[dbo].[User_DIS]", commandType: CommandType.StoredProcedure);
            return Page();
        }
        public IActionResult OnPostUpd()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            con.Query("[dbo].[User_UPD]", new
            {
                @Password = Password,
                @Username = Username,
                @Class = Class,
                @Id = Id
            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostDel()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            con.Query("[dbo].[User_DEL]", new
            {
                @Id = Id2

            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostSea()
        {
            var con = new SqlConnection(_config.GetConnectionString("CalambroDB"));
            list = con.Query<Users.UserModel>("[dbo].[User_SEA]", new
            {
                @Key = $"%{Search}%"

            }, commandType: CommandType.StoredProcedure);
            return Page();
        }

    }

}

