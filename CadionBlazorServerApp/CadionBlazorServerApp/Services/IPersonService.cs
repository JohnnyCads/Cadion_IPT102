using CadionBlazorServerApp.Services;
using CadionBlazorServerApp.Models;
using CadionBlazorServerApp.Pages;
using Microsoft.EntityFrameworkCore;
namespace CadionBlazorServerApp.Services
{
    public interface IPersonService
    {
         bool AddUpdate(Person person);
         bool Delete(int id);
        Person FindById (int id);
        List<Person> FindAll();
    }
}
