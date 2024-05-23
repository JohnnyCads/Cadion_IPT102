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
    public class VapeModel : PageModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string VapeType { get; set; }
        public string Price { get; set; }
        public int Id2 { get; set; }
        public string Name2 { get; set; }
        public string VapeType2 { get; set; }
        public string Price2 { get; set; }
        public string Search { get; set; }

        private readonly ILogger<VapeModel> _logger;
        private readonly IConfiguration _config;
        public IEnumerable<Users.VapeModel> list { get; set; }

        public VapeModel(ILogger<VapeModel> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config;
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.VapeModel>("[dbo].[Vape_DIS]", commandType: CommandType.StoredProcedure);
        }
        public IActionResult OnPostAdd()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            con.Query("[dbo].[Vape_ADD]", new
            {
                @Name = Name,
                @VapeType = VapeType,
                @Price = Price
            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostUpd()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            con.Query("[dbo].[Vape_UPD]", new
            {
                @Id = Id,
                @Name = Name,
                @VapeType = VapeType,
                @Price = Price
            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostDel()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            con.Query("[dbo].[Vape_DEL]", new
            {
                @Id = Id2

            }, commandType: CommandType.StoredProcedure);
            return RedirectToPage();
        }
        public IActionResult OnPostSea()
        {
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.VapeModel>("[dbo].[Vape_SEA]", new
            {
                @key = $"%{Search}%"

            }, commandType: CommandType.StoredProcedure);
            return Page();
        }
        public IActionResult OnPostEdi()
        {

            Name = Name2;
            VapeType = VapeType2;
            Price = Price2;
            Id = Id2;
            var con = new SqlConnection(_config.GetConnectionString("CadionDB"));
            list = con.Query<Users.VapeModel>("[dbo].[Vape_DIS]", commandType: CommandType.StoredProcedure);

            return Page();
        }
    }
}
