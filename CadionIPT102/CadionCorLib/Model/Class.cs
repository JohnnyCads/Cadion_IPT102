#nullable disable
namespace CadionCorLib.Model
{
    public class Users
    {
            

        public class UserModel
        {
            public int Id { get; set; }
            public string Password { get; set; }
            public string Username { get; set; }
            public string Class { get; set; }
        }
        public class VapeModel
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Flavor { get; set; }
            public string Milligrams { get; set; }

        }
    }
}
