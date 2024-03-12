# nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CadionClassLib.Service
{
    public interface IProfileStateService
    {
        int? SelectedId { get; set; }
        event Action OnChange;
        void NotifyStateChanged();
    }

    public class ProfileStateService : IProfileStateService
    {
        public int? SelectedId { get; set; }
        public event Action OnChange;

        public void NotifyStateChanged() => OnChange?.Invoke();
    }

}
