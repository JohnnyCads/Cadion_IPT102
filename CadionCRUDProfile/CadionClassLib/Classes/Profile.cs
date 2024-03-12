# nullable disable
using System;
using CadionClassLib;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CadionClassLib.Classes
{
    public interface IProfile
    {
        int Id { get; set; }
        string FirstName { get; set; }
        string SureName { get; set; }
        string MiddleInitial { get; set; }
        string Email { get; set; }
        int PhoneNumber { get; set; }
        string Address { get; set; }
        string Hobbies { get; set; }
        string PhotoBase64 { get; set; }
    }
    public class Profile : IProfile
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string SureName { get; set; }
        public string MiddleInitial { get; set; }
        public string Email { get; set; }
        public int PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Hobbies{ get; set; }
        public string PhotoBase64 { get; set; }
    }
}
