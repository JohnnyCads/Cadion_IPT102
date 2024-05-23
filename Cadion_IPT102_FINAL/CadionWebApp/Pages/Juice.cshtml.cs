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
    public class JuiceModel : PageModel
    {
      
     
            public int Id { get; set; }
            public string BrandName { get; set; }
            public string Flavor { get; set; }
            public string Price { get; set; }
            public int Id2 { get; set; }
            public string BrandName2 { get; set; }
            public string Flavor2 { get; set; }
            public string Price2 { get; set; }
            public string Search { get; set; }

            private readonly ILogger<JuiceModel> _logger;
            private readonly IConfiguration _config;
            public IEnumerable<Users.JuiceModel> list { get; set; }

            public JuiceModel(ILogger<JuiceModel> logger, IConfiguration config)
            {
                _logger = logger;
                _config = config;
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                list = con.Query<Users.JuiceModel>("[dbo].[Juice_DIS]", commandType: CommandType.StoredProcedure);
            }
            public IActionResult OnPostAdd()
            {
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                con.Query("[dbo].[Juice_ADD]", new
                {
                    @BrandName = BrandName,
                    @Flavor = Flavor,
                    @Price = Price
                }, commandType: CommandType.StoredProcedure);
                return RedirectToPage();
            }
            public IActionResult OnPostUpd()
            {
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                con.Query("[dbo].[Juice_UPD]", new
                {
                    @Id = Id,
                    @BrandName = BrandName,
                    @Flavor = Flavor,
                    @Price = Price
                }, commandType: CommandType.StoredProcedure);
                return RedirectToPage();
            }
            public IActionResult OnPostDel()
            {
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                con.Query("[dbo].[Juice_DEL]", new
                {
                    @Id = Id2

                }, commandType: CommandType.StoredProcedure);
                return RedirectToPage();
            }
            public IActionResult OnPostSea()
            {
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                list = con.Query<Users.JuiceModel>("[dbo].[Juice_SEA]", new
                {
                    @key = $"%{Search}%"

                }, commandType: CommandType.StoredProcedure);
                return Page();
            }
            public IActionResult OnPostEdi()
            {

                BrandName = BrandName2;
                Flavor = Flavor2;
                Price = Price2;
                Id = Id2;
                var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
                list = con.Query<Users.JuiceModel>("[dbo].[Juice_DIS]", commandType: CommandType.StoredProcedure);

                return Page();
            }
        }
    }
