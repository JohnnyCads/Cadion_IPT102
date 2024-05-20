
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
    public class IndexModel : PageModel
    {
        public string Password { get; set; }
        public string Username { get; set; }
        public string Class { get; set; }


        private readonly ILogger<IndexModel> _logger;
        private readonly IConfiguration _config;

        public IEnumerable<Users.UserModel> list { get; set; }
        public IndexModel(ILogger<IndexModel> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config;
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.UserModel>("[dbo].[User_DIS]", commandType: CommandType.StoredProcedure);
            list = con.Query<Users.UserModel>("[dbo].[User_SEA]", new
            {
                @Key = "",
            }, commandType: CommandType.StoredProcedure);
        }

        public IActionResult OnPostLog()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.UserModel>("[dbo].[User_LOG]", new
            {
                @Password = Password,
                @Username = Username
            }, commandType: CommandType.StoredProcedure);

            return Page();
        }
        public IActionResult OnPostVer()
        {
            if (Class == "Admin")
            {
                return RedirectToPage("/Admin");

            }
            else
            {
                return Page();

            }

        }
    }
}
